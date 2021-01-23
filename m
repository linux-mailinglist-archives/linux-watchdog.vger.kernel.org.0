Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E208130171A
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 18:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbhAWRQU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 12:16:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbhAWRQT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 12:16:19 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FECEC06174A;
        Sat, 23 Jan 2021 09:15:39 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id w8so9912604oie.2;
        Sat, 23 Jan 2021 09:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7SIz1JmNnwDFUjSTMhnENtc8aHZxznwTy6tSnMCh7fI=;
        b=Egtvj3+jQuKuSuErJ0hLRSio540Vdb3d/1lwON8uvVtCsnMqqCoviMycCn0R91DgiX
         e/D8pf4SXx8/JB60LA925do3YKcGS4CP/u4OW+I6h3tmxEwPqFziw6dzTumBDFaD6K9s
         Z1MYFqGQYCBoezETQgFfQH2Amh2KYIzelQMBjOzh977W58W6XpEW44skNkl9Ve4ZETYB
         sYjOBM0DOBTJI2W99odsPLCjaBAAJqwI2dENnSmfZltanCJOrqElB5SUUFrbePVB/By0
         O0Y/ljTkjSFY1ioIF8w0Tab9G5kfSweSNKT2arkCS/Hos7xvboK2vt1jLgZZ5Uv7PaDo
         t5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=7SIz1JmNnwDFUjSTMhnENtc8aHZxznwTy6tSnMCh7fI=;
        b=OI4SMAklSCmZGAl88Mw1uLkT03qoM4KSEBjFhht9KQMCX5VZdWCdKr/FTXlI0siHEH
         5DOq+lZT7ZFAAeejYL42+jygdXiS3aaySktbfh61yJ4QQUWmbFME4jRGBAzMvPX1F3/4
         14qYkcJlW0tcXqdfOg18IE3hKFaf+cQY0xUm2tfuPByTrmnbthStAVF38MZzL3NdS+mo
         0saIOFYBXH0kxrPJiKeOL02ODpRfNdZGgV+HW5NQ2aSU6+c+Nrrasz6zyDl53BOSDNri
         EMJg2iQxcJJ8b3zOwVA05kb2+ceOFeCTyOVOBPD4rbQMa9UZTbXup5Rkh7VBLUqXnzZf
         JjJQ==
X-Gm-Message-State: AOAM5338Cam/icoqnL5fFbqg00vFPx1vM+3IE4jQWEJezRX6jyho/VjP
        MeqpSWA1PptHwnxWCTGKW4BegBNlN+k=
X-Google-Smtp-Source: ABdhPJxZEVxk0HSstfTgZ03TKu/l9h2RFiMju0o1xBbAogtUWwOhGMr6MvX8lKKnKOSj0G9S+bSEIQ==
X-Received: by 2002:aca:d643:: with SMTP id n64mr6643551oig.151.1611422138666;
        Sat, 23 Jan 2021 09:15:38 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8sm2411963oie.47.2021.01.23.09.15.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 09:15:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 09:15:36 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     trix@redhat.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: it8712f_wdt: remove definition of DEBUG
Message-ID: <20210123171536.GA55320@roeck-us.net>
References: <20210115153237.131357-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115153237.131357-1-trix@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jan 15, 2021 at 07:32:37AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Defining DEBUG should only be done in development.
> So remove DEBUG.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/it8712f_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/it8712f_wdt.c b/drivers/watchdog/it8712f_wdt.c
> index 9b89d2f09568..3ce6a58bd81e 100644
> --- a/drivers/watchdog/it8712f_wdt.c
> +++ b/drivers/watchdog/it8712f_wdt.c
> @@ -31,7 +31,6 @@
>  #include <linux/io.h>
>  #include <linux/ioport.h>
>  
> -#define DEBUG
>  #define NAME "it8712f_wdt"
>  
>  MODULE_AUTHOR("Jorge Boncompte - DTI2 <jorge@dti2.net>");
