Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAB0CFD4F
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Oct 2019 17:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbfJHPOY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Oct 2019 11:14:24 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41442 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfJHPOY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Oct 2019 11:14:24 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so10929783pfh.8;
        Tue, 08 Oct 2019 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9/NLQWTNEuXn4pvNFMYq67eFLXjRGHQQAqmJZvvr5qQ=;
        b=IL/Jx1w/iEhJ1ryW9n2Y/pLsbJbTJN2884Z2VUG505oJoHjkY/FmwIfikKr5lLMEy8
         PEbYL9rXWvxpfq08aAxYsq25BJraBCOvlDkYqRzdIfk3EzFgCouuDtO85fwGz9Lx6MOp
         J1mToEAsZjqsqabsQHE1+XZX74Pa/JBV5DndexMhgmrc1zYN9SPsy3crH++13kv2mrAy
         4B+RsJf357+4fFlv6PBhkStNQ1k1ZPgi8XJ6MgKgBbzabN4TSv7LKyT5XXWMe+hm1aeK
         3KG2KIRcXntKk//0K07hxJwu7+aoyBL96bJ5LpNdvRkZULO/b22+hfiYBvjbM3NVNvpR
         HHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9/NLQWTNEuXn4pvNFMYq67eFLXjRGHQQAqmJZvvr5qQ=;
        b=H1Tz1iiyjodMh96kbgvid3WgCLMmIeu6n1OcsGJcMJOHasvavk8krXX/GkM1MZuODC
         lNSTl9qbfPgQu0dQzI/ihNuwPZq1uTZYTJrW/Y49ncF9D5WQlQYknskyav30t9QWDIr1
         n/tUTNMBeQMD4CCLCZxl0SIE9BZ4ZorWKs+rjM3Z3zFDWhRcbHTuhBNA+8T7pMYLnnQL
         dDoYka4ibSo4Pv7/goC1xePYHcb5+3ZOdFFqZgJCrYmhqtMjEzGqOvj1GH19iNsU13pr
         B4I6eds84lZRi5tRyNI/2Ez+iZghGJcwfHkqLTgzOxU3ZuQwaWLD4io3o5XHhnaqAkpM
         MbQg==
X-Gm-Message-State: APjAAAWEJpwZbvAQ0GZ+Uuc9gAOyRlO5Wgz7Gl8OiIdrZrEcCYpsKQpR
        dtnR22QS7fisGRaYJyxsXPvWnTTX
X-Google-Smtp-Source: APXvYqzaEMOpbOaYXZTwY/46sBEGHZGUQrP5ukhoOGDw2dNQ5qdtCIgOAB/oXSt/4jDqdo3VJKjXEw==
X-Received: by 2002:a65:684e:: with SMTP id q14mr30020407pgt.130.1570547663652;
        Tue, 08 Oct 2019 08:14:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g19sm16145773pgm.63.2019.10.08.08.14.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 08:14:22 -0700 (PDT)
Date:   Tue, 8 Oct 2019 08:14:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: cpwd: fix build regression
Message-ID: <20191008151420.GA15540@roeck-us.net>
References: <20191008073634.290255-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008073634.290255-1-arnd@arndb.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Oct 08, 2019 at 09:36:16AM +0200, Arnd Bergmann wrote:
> The compat_ptr_ioctl() infrastructure did not make it into
> linux-5.4, so cpwd now fails to build.
> 
> Fix it by using an open-coded version.
> 
> Fixes: 68f28b01fb9e ("watchdog: cpwd: use generic compat_ptr_ioctl")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/watchdog/cpwd.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
> index 9393be584e72..808eeb4779e4 100644
> --- a/drivers/watchdog/cpwd.c
> +++ b/drivers/watchdog/cpwd.c
> @@ -26,6 +26,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/ioport.h>
>  #include <linux/timer.h>
> +#include <linux/compat.h>
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
>  #include <linux/io.h>
> @@ -473,6 +474,11 @@ static long cpwd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	return 0;
>  }
>  
> +static long cpwd_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	return cpwd_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
> +}
> +
>  static ssize_t cpwd_write(struct file *file, const char __user *buf,
>  			  size_t count, loff_t *ppos)
>  {
> @@ -497,7 +503,7 @@ static ssize_t cpwd_read(struct file *file, char __user *buffer,
>  static const struct file_operations cpwd_fops = {
>  	.owner =		THIS_MODULE,
>  	.unlocked_ioctl =	cpwd_ioctl,
> -	.compat_ioctl =		compat_ptr_ioctl,
> +	.compat_ioctl =		cpwd_compat_ioctl,
>  	.open =			cpwd_open,
>  	.write =		cpwd_write,
>  	.read =			cpwd_read,
> -- 
> 2.20.0
> 
