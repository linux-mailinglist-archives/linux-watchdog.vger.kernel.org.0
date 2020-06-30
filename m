Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624B520FE85
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 23:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbgF3VLV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 17:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgF3VLV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 17:11:21 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C4BC061755;
        Tue, 30 Jun 2020 14:11:21 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l63so10506990pge.12;
        Tue, 30 Jun 2020 14:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yu6NuPC3Q+KecbyZ7IV3fBQtyD9sH978qBZ87aU1QUo=;
        b=Df3jej+5oQGsu0GbudM2ZsoDBQqOZjNPjXB5WOAnPbuOHhLKVuKWaNygkAxki7th5u
         IXIlFw97usFyE6QjDSr8LaCMLv/b+YL56X8eIf1m8HRp0YDbheFdskZNePBNXkIAi7uV
         WwuhHjod125oa468tRB8J4KVAiHUB+7U7eHJa43z5XJHGDXH6k+mrk+i6u3OxPJ3e3pH
         brUqv814ft6FIpe1uq4RljC0Gj5FfoWkluo8OEIfsgSAha2YpDisbcp5iDrmjs2n38h0
         cCYr/7d8AUJgyh+vJ6hs9Jqay0HYF0l6l3zQPpzgNXykz6XPaEaPYPpqZevZ7QgOV25J
         VwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yu6NuPC3Q+KecbyZ7IV3fBQtyD9sH978qBZ87aU1QUo=;
        b=fwQoXmBGybs9iPZv8ThVEtzKZa4DpYx11+/3JF5A4xOQRyC3lG/8BXwlP5DZkayQSQ
         zAurbHXsJd9pEPPgpCPNIxPLnqIdc2BBveQkd3DaWTLn5WAZO90Wo24PbFf/ZkGAUnEu
         +FaAjCXTz1B3VXsNU3AzTRtCtBake8FU8gGAUCMbCw6K3WhT6r10yWl892dLVswd5TXl
         Y7fSTTXGMLXlc8s3ePcy1cTNhJKzAqUv/DFacOn83/Be88GDYs5nZSVqOtGSETP8bJ7p
         pHYbyyH7bq32S7e46D/aXb0pT7AXglAmagl+iXYsWWJ9jrkFIrkH5b8Z8he3wJsyeyI6
         AC8Q==
X-Gm-Message-State: AOAM530szUlM1Sv02Bu7SsOkC4eDn5uPDzabXHRplJMjANTf0GO7iFce
        NzPeXCXjTgBGMnm6PONYCnx00dlJ
X-Google-Smtp-Source: ABdhPJyf7MPQiidBWihoX7KAJT9OyvhkRpcuO25xqMJEmeZRbdkNOiewjHgnWJsOhS+XF7812xmIpQ==
X-Received: by 2002:a62:158d:: with SMTP id 135mr1577972pfv.287.1593551480156;
        Tue, 30 Jun 2020 14:11:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 73sm3636634pfy.24.2020.06.30.14.11.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 14:11:19 -0700 (PDT)
Date:   Tue, 30 Jun 2020 14:11:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/8] watchdog: f71808e_wdt: do stricter parameter
 validation
Message-ID: <20200630211118.GA23432@roeck-us.net>
References: <20200611191750.28096-1-a.fatoum@pengutronix.de>
 <20200611191750.28096-6-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611191750.28096-6-a.fatoum@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 11, 2020 at 09:17:46PM +0200, Ahmad Fatoum wrote:
> We check the f71862fg_pin module parameter every time a watchdog device
> for the f71862fg is opened, but the parameter can't change at runtime.
> 
> If we move the check to the start of init:
> 
>   - We catch userspace passing invalid, but unused, values
>   - We check the condition only once
>   - We simplify the code
> 
> Do so.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/f71808e_wdt.c | 37 +++++++++++-----------------------
>  1 file changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index 26bf366aebc2..9f7823819ed1 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -306,27 +306,6 @@ static int watchdog_keepalive(void)
>  	return err;
>  }
>  
> -static int f71862fg_pin_configure(unsigned short ioaddr)
> -{
> -	/* When ioaddr is non-zero the calling function has to take care of
> -	   mutex handling and superio preparation! */
> -
> -	if (f71862fg_pin == 63) {
> -		if (ioaddr) {
> -			/* SPI must be disabled first to use this pin! */
> -			superio_clear_bit(ioaddr, SIO_REG_ROM_ADDR_SEL, 6);
> -			superio_set_bit(ioaddr, SIO_REG_MFUNCT3, 4);
> -		}
> -	} else if (f71862fg_pin == 56) {
> -		if (ioaddr)
> -			superio_set_bit(ioaddr, SIO_REG_MFUNCT1, 1);
> -	} else {
> -		pr_err("Invalid argument f71862fg_pin=%d\n", f71862fg_pin);
> -		return -EINVAL;
> -	}
> -	return 0;
> -}
> -
>  static int watchdog_start(void)
>  {
>  	int err;
> @@ -352,9 +331,13 @@ static int watchdog_start(void)
>  		break;
>  
>  	case f71862fg:
> -		err = f71862fg_pin_configure(watchdog.sioaddr);
> -		if (err)
> -			goto exit_superio;
> +		if (f71862fg_pin == 63) {
> +			/* SPI must be disabled first to use this pin! */
> +			superio_clear_bit(watchdog.sioaddr, SIO_REG_ROM_ADDR_SEL, 6);
> +			superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 4);
> +		} else if (f71862fg_pin == 56) {
> +			superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 1);
> +		}
>  		break;
>  
>  	case f71868:
> @@ -810,7 +793,6 @@ static int __init f71808e_find(int sioaddr)
>  		break;
>  	case SIO_F71862_ID:
>  		watchdog.type = f71862fg;
> -		err = f71862fg_pin_configure(0); /* validate module parameter */
>  		break;
>  	case SIO_F71868_ID:
>  		watchdog.type = f71868;
> @@ -859,6 +841,11 @@ static int __init f71808e_init(void)
>  	int err = -ENODEV;
>  	int i;
>  
> +	if (f71862fg_pin != 63 && f71862fg_pin != 56) {
> +		pr_err("Invalid argument f71862fg_pin=%d\n", f71862fg_pin);
> +		return -EINVAL;
> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(addrs); i++) {
>  		err = f71808e_find(addrs[i]);
>  		if (err == 0)
