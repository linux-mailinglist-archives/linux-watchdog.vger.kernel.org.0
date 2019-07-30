Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76DB77AEC2
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 19:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbfG3Q7L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jul 2019 12:59:11 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33151 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730314AbfG3Q7L (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jul 2019 12:59:11 -0400
Received: by mail-pf1-f196.google.com with SMTP id g2so30158827pfq.0
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jul 2019 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=chZ/hmuTa79j1nuTF8bh75LYK+22XoJb+ykbFeHxsWQ=;
        b=jiw/JaXw08GRci761dQhECGHj/W39qzJwt7nm8fZFLa+/t2HBvmbAU3NvMXzmFJAS/
         dwjcmkqtO/draTZDAKXndVhQ7SYBollfHZvHCk62R6a7+1l5VC8niLPNvHqXc3ToF9wS
         IdcKb/U96tk9CsCgCyHBSBs9K/9VGVAgzN8Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=chZ/hmuTa79j1nuTF8bh75LYK+22XoJb+ykbFeHxsWQ=;
        b=bXLWuQSgZUQXpZWx0bKrXlUySfUgRLImULr7tvFu6av0YdW2XrDAp5tpO9xIXQgOLt
         PhKC1UtloQfToz3OFISjYbDuG/2KBaXli71WOn9hMMyVwN2ZTotOPl9G3O7i2hYABCrb
         jNkB231er3KXYgXkvfIg5wjTQ+LPBRVYTE8uhnpJwGgrGDNPwUZ9cYdiblVAW6Sa6Bek
         Xc6/iPUqfH8HPkhKPu/nDHelxGtMNFNN3SgKucxP/ghoGANeF93y35MdmxY3qmpnFLjl
         yu0vAMWXTRQyM3v66e5wCqCoKIAkpwT8og+9rFsqkexSj9Paqw2+rreYEL74sXmi49y+
         Wrvw==
X-Gm-Message-State: APjAAAX8ioYIHbGP6R8O8qMeYhB6j8UnZ0ppt6K35ka1pWNKnauyClf2
        V9Gt7iMhIhaxkuJNmuZCBwuVAA==
X-Google-Smtp-Source: APXvYqz64fvFrOx90CrnjDAFQAvv+4LSKlHVm0rW+mMJE/poHVz2/FZ+E51UNIKq592I/iHMOpJZcw==
X-Received: by 2002:a65:57ca:: with SMTP id q10mr113113836pgr.52.1564505950472;
        Tue, 30 Jul 2019 09:59:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a21sm74126668pfi.27.2019.07.30.09.59.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 09:59:09 -0700 (PDT)
Date:   Tue, 30 Jul 2019 09:59:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: riowd: Mark expected switch fall-through
Message-ID: <201907300959.A1632E8D19@keescook>
References: <20190730014650.GA31309@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190730014650.GA31309@embeddedor>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 29, 2019 at 08:46:50PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warnings (Building: sparc64):
> 
> drivers/watchdog/riowd.c: In function ‘riowd_ioctl’:
> drivers/watchdog/riowd.c:136:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    riowd_writereg(p, riowd_timeout, WDTO_INDEX);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/watchdog/riowd.c:139:2: note: here
>   case WDIOC_GETTIMEOUT:
>   ^~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/watchdog/riowd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
> index 41a2a11535a6..b35f7be20c00 100644
> --- a/drivers/watchdog/riowd.c
> +++ b/drivers/watchdog/riowd.c
> @@ -134,7 +134,7 @@ static long riowd_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  			return -EINVAL;
>  		riowd_timeout = (new_margin + 59) / 60;
>  		riowd_writereg(p, riowd_timeout, WDTO_INDEX);
> -		/* Fall */
> +		/* Fall through */
>  
>  	case WDIOC_GETTIMEOUT:
>  		return put_user(riowd_timeout * 60, (int __user *)argp);
> -- 
> 2.22.0
> 

-- 
Kees Cook
