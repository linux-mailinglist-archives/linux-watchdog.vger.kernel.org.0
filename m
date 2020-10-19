Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6CA9292ECC
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Oct 2020 21:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgJSTw2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Oct 2020 15:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbgJSTw2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Oct 2020 15:52:28 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD50C0613CE;
        Mon, 19 Oct 2020 12:52:28 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id u127so1287566oib.6;
        Mon, 19 Oct 2020 12:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EhXizSrh4R4eIPjTTuSFfzdfC/n7nEHrr6KS/7gHsSc=;
        b=oFM4JtQMxehUrQdopjCX6FLxzMjAMM3kv0QGXZXgfo18pYKgH7M+0o5OSUqo09Ns67
         dY1JBqKBkuBatWEv1D2VApDeYQfcxyj7hQKmaKniK/J2jJu3F4HeuwJFZuNKhUz48/fb
         UM0DUai7zpqBCQY1ZpsDVWMKIRJkgg2lRB/xSUtkZQM/XjqAX141lcbhECAcVUtgRkl8
         QpCyQZTajq2VHpm88Xjw9rtxwM5709RFSbkS1dRWFPT7/DCaY0vFOkuxjASzq2jXGDe+
         8waqlHErX749xL6zMd2pnxsZ0lpPk/cefcdR7B3tea/ZQcEZaFzLhcHR70yAjTAdGNkM
         E63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=EhXizSrh4R4eIPjTTuSFfzdfC/n7nEHrr6KS/7gHsSc=;
        b=CFDRzFk/Dvgkxx3P4iMXN6MLfR1i8eQW1SRrCZFNJDDK0PbcDDKaA3fCtZZf5zfzg7
         h1ISrDnMFXEMQDCyDIEoCK/jsdbIRG2FNYT2ge5jncwgbkw0xVJydLmf+/xEFIgP6u3r
         blhlTZjoJirZHU2nF+7FMNwnb5uveMI+pNbdo17uKttRY+IjecFwYr4eXt0X8AhVc2ZW
         CTE5uHpzbsdt2g04VNPLif1V6ah0M6ZrgVfNs8afeOX74WuvzzJFo0Qbn8eNOR8yfMEs
         cpYgSqNaS85265/GjqmoePZvUD3DdjGx4+u5d5PL9xdnXuOXr1TDOCB1pJLSipJxi34m
         rIXg==
X-Gm-Message-State: AOAM530QQ6IEAi0a9IZo8YBI2aPu96R0uSWgqSxxeZqxDZjVzNetriS2
        s2g4cDOwHEzg6n/baP3q3gQ=
X-Google-Smtp-Source: ABdhPJynmYk7NKFgdl/N8ZDial/MnMI0gul5e/W9BnSt+u9hF2NsFV+O2Hgyad9o8A0I3+XpMTpVPA==
X-Received: by 2002:aca:3882:: with SMTP id f124mr649880oia.111.1603137147696;
        Mon, 19 Oct 2020 12:52:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 8sm211034oii.45.2020.10.19.12.52.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 12:52:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 19 Oct 2020 12:52:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     trix@redhat.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: remove unneeded break
Message-ID: <20201019195225.GA218904@roeck-us.net>
References: <20201019175342.2646-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019175342.2646-1-trix@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Oct 19, 2020 at 10:53:42AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A break is not needed if it is preceded by a return
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/geodewdt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/watchdog/geodewdt.c b/drivers/watchdog/geodewdt.c
> index 83418924e30a..0b699c783d57 100644
> --- a/drivers/watchdog/geodewdt.c
> +++ b/drivers/watchdog/geodewdt.c
> @@ -150,8 +150,6 @@ static long geodewdt_ioctl(struct file *file, unsigned int cmd,
>  	case WDIOC_GETSUPPORT:
>  		return copy_to_user(argp, &ident,
>  				    sizeof(ident)) ? -EFAULT : 0;
> -		break;
> -
>  	case WDIOC_GETSTATUS:
>  	case WDIOC_GETBOOTSTATUS:
>  		return put_user(0, p);
> -- 
> 2.18.1
> 
