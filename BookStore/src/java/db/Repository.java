/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import com.sun.org.apache.bcel.internal.generic.BREAKPOINT;
import domain.Author;
import domain.Book;
import domain.Ganre;
import domain.Publisher;
import domain.User;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author balnur
 */
public class Repository {

    public ArrayList<Book> getBooksByAuthor(Author author)
            throws Exception {
        ArrayList<Book> list = new ArrayList<Book>();

        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"books\""
                + "WHERE author_id=" + author.getId();
        ResultSet rs = dbw.runQuery(sql);
        while (rs.next()) {
            list.add(getBook(rs.getInt("id")));
        }

        return list;
    }

    public ArrayList<Book> getBooksOfPublisher(Publisher publisher)
            throws Exception {
        ArrayList<Book> list = new ArrayList<Book>();

        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"books\" "
                + "WHERE publisher_id=" + publisher.getId();
        ResultSet rs = dbw.runQuery(sql);
        while (rs.next()) {
            list.add(getBook(rs.getInt("id")));
        }

        return list;
    }

    public ArrayList<Book> getBooksByGanre(Ganre ganre) throws Exception {
        ArrayList<Book> list = new ArrayList<Book>();
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"books\" WHERE genre_id=" + ganre.getId();
        ResultSet rs = dbw.runQuery(sql);
        while (rs.next()) {
            list.add(getBook(rs.getInt("id")));
        }
        return list;
    }

    public Author getAuthor(int id) throws Exception {
        Author a = null;
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"authors\" "
                + "WHERE id=" + id;
        ResultSet rs = dbw.runQuery(sql);
        if (rs.next()) {
            a = new Author();
            a.setId(rs.getInt("id"));
            a.setName(rs.getString("name"));
        }
        return a;
    }

    public Author getAuthor(String name) throws Exception {
        Author a = null;
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"authors\" "
                + "WHERE name='" + name + "'";
        ResultSet rs = dbw.runQuery(sql);
        if (rs.next()) {
            a = new Author();
            a.setId(rs.getInt("id"));
            a.setName(rs.getString("name"));
        }
        return a;
    }

    public Ganre getGanre(int id) throws Exception {
        Ganre g = null;
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"genre\" "
                + "WHERE id=" + id;
        ResultSet rs = dbw.runQuery(sql);
        if (rs.next()) {
            g = new Ganre();
            g.setId(rs.getInt("id"));
            g.setTitle(rs.getString("title"));
        }
        return g;
    }

    public Ganre getGanre(String title) throws Exception {
        Ganre g = null;
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"genre\" "
                + "WHERE title='" + title + "'";
        ResultSet rs = dbw.runQuery(sql);
        if (rs.next()) {
            g = new Ganre();
            g.setId(rs.getInt("id"));
            g.setTitle(rs.getString("title"));
        }
        return g;
    }

    public Publisher getPublisher(int id) throws Exception {
        Publisher p = null;
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"publishers\" "
                + "WHERE id=" + id;
        ResultSet rs = dbw.runQuery(sql);
        if (rs.next()) {
            p = new Publisher();
            p.setId(rs.getInt("id"));
            p.setAddress(rs.getString("address"));
            p.setTitle(rs.getString("title"));
        }
        return p;
    }

    public Publisher getPublisher(String title) throws Exception {
        Publisher p = null;
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"publishers\" "
                + "WHERE title='" + title + "'";
        ResultSet rs = dbw.runQuery(sql);
        if (rs.next()) {
            p = new Publisher();
            p.setId(rs.getInt("id"));
            p.setAddress(rs.getString("address"));
            p.setTitle(rs.getString("title"));
        }
        return p;
    }

    public Book getBook(int id) throws Exception {
        Book b = null;
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"books\" WHERE id=" + id;
        ResultSet rs = dbw.runQuery(sql);
        if (rs.next()) {
            b = new Book();
            b.setId(rs.getInt("id"));
            b.setTitle(rs.getString("title"));
            b.setPrice(rs.getInt("price"));
            b.setYear(rs.getInt("year"));
            b.setAuthor(getAuthor(rs.getInt("author_id")));
            b.setGanre(getGanre(rs.getInt("genre_id")));
            b.setPublisher(getPublisher(rs.getInt("publisher_id")));
        }
        return b;
    }

    public ArrayList<Book> getBooks() throws Exception {
        ArrayList<Book> books = new ArrayList<Book>();
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"books\"";
        ResultSet rs = dbw.runQuery(sql);
        while (rs.next()) {
            books.add(getBook(rs.getInt("id")));
        }
        return books;
    }

    public ArrayList<Author> getAuthors() throws Exception {
        ArrayList<Author> authors = new ArrayList<Author>();
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"authors\" ORDER BY id";
        ResultSet rs = dbw.runQuery(sql);
        while (rs.next()) {
            authors.add(getAuthor(rs.getInt("id")));
        }
        return authors;
    }

    public ArrayList<Publisher> getPublishers() throws Exception {
        ArrayList<Publisher> publishers = new ArrayList<Publisher>();
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"publishers\" ORDER BY id";
        ResultSet rs = dbw.runQuery(sql);
        while (rs.next()) {
            publishers.add(getPublisher(rs.getInt("id")));
        }
        return publishers;
    }

    public ArrayList<Ganre> getGanres() throws Exception {
        ArrayList<Ganre> ganres = new ArrayList<Ganre>();
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"genre\" ORDER BY id";
        ResultSet rs = dbw.runQuery(sql);
        while (rs.next()) {
            ganres.add(getGanre(rs.getInt("id")));
        }
        return ganres;
    }

    public void saveBook(Book b) throws Exception {
        DBWrapper dbw = DBWrapper.Instance();
        String sql;
        if (b.getId() == 0) {
            sql = "INSERT INTO \"books\"(title,author_id,genre_id,publisher_id,year,price)"
                    + "VALUES('" + b.getTitle() + "'," + b.getAuthor().getId() + "," + b.getGanre().getId() + "," + b.getPublisher().getId()
                    + "," + b.getYear() + "," + b.getPrice() + ")";
        } else {
            sql = "UPDATE \"books\" SET title='" + b.getTitle() + "', author_id=" + b.getAuthor().getId() + ", genre_id=" + b.getGanre().getId() + ", publisher_id=" + b.getPublisher().getId()
                    + ", year=" + b.getYear() + ",price=" + b.getPrice() + " WHERE id=" + b.getId();
        }
        dbw.runUpdate(sql);
    }

    public void saveAuthor(Author a) throws Exception {
        DBWrapper dbw = DBWrapper.Instance();
        String sql;
        if (a.getId() == 0) {
            sql = "INSERT INTO \"authors\"(name) VALUES('" + a.getName() + "')";
        } else {
            sql = "UPDATE \"authors\" SET name='" + a.getName() + "' WHERE id=" + a.getId();
        }
        dbw.runUpdate(sql);
    }

    public void saveGanre(Ganre g) throws Exception {
        DBWrapper dbw = DBWrapper.Instance();
        String sql;
        if (g.getId() == 0) {
            sql = "INSERT INTO \"genre\"(title) VALUES('" + g.getTitle() + "')";
        } else {
            sql = "UPDATE \"genre\" SET title='" + g.getTitle() + "' WHERE id=" + g.getId();
        }
        dbw.runUpdate(sql);
    }

    public void savePublisher(Publisher p) throws Exception {
        DBWrapper dbw = DBWrapper.Instance();
        String sql;
        if (p.getId() == 0) {
            sql = "INSERT INTO \"publishers\"(title,address) VALUES('" + p.getTitle() + "','" + p.getAddress() + "')";
        } else {
            sql = "UPDATE \"publishers\" SET title='" + p.getTitle() + "', address='" + p.getAddress() + "' WHERE id=" + p.getId();
        }
        dbw.runUpdate(sql);
    }

    public void deleteBook(Book b) throws Exception {
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "DELETE FROM \"books\" WHERE id=" + b.getId();
        dbw.runUpdate(sql);
    }

    public void deleteAuthor(Author a) throws Exception {
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "DELETE FROM \"authors\" WHERE id=" + a.getId();
        dbw.runUpdate(sql);
    }

    public void deleteGanre(Ganre g) throws Exception {
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "DELETE FROM \"genre\" WHERE id=" + g.getId();
        dbw.runUpdate(sql);
    }

    public void deletePublisher(Publisher p) throws Exception {
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "DELETE FROM \"publishers\" WHERE id=" + p.getId();
        dbw.runUpdate(sql);
    }

    public User getUser(String username, String passwd) throws Exception {
        User u = null;
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"Users\" WHERE username='" + username + "' AND passwd='" + passwd + "'";
        ResultSet rs = dbw.runQuery(sql);
        if(rs.next()){
            u = new User();
            u.setId(rs.getInt("id"));
            u.setUsername(username);
            u.setPasswd(passwd);
            if(rs.getInt("admin")==1){
                u.setAdmin(true);
            }else {
                u.setAdmin(false);
            }
        }
        return u;
    }
    
    
    public boolean isAdmin(HttpSession hs){
        User u = (User)hs.getAttribute("user");
        if(u==null){
            return false;
        }
        return u.isAdmin();
    }
    
    public void saveUser(User u) throws Exception {
        DBWrapper dbw = DBWrapper.Instance();
        String sql;
        if (u.getId() == 0) {
            sql = "INSERT INTO \"Users\"(username,passwd) VALUES('" + u.getUsername() + "','" + u.getPasswd() + "')";
        } else {
            sql = "UPDATE \"Users\" SET username='" + u.getUsername() + "', passwd='" + u.getPasswd() + "' WHERE id=" + u.getId();
        }
        dbw.runUpdate(sql);
    }
    
     public ArrayList<User> getUsers() throws Exception {
        ArrayList<User> users = new ArrayList<User>();
        DBWrapper dbw = DBWrapper.Instance();
        String sql = "SELECT * FROM \"Users\" ORDER BY id";
        ResultSet rs = dbw.runQuery(sql);
        while (rs.next()) {
            users.add(getUser(rs.getString("username"),rs.getString("passwd")));
        }
        return users;
    }
}
