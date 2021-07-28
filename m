Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3613D94F3
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jul 2021 20:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhG1SEj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Jul 2021 14:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhG1SEj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Jul 2021 14:04:39 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD68C061757;
        Wed, 28 Jul 2021 11:04:37 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id d3so1999396qvq.6;
        Wed, 28 Jul 2021 11:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TsqHP2eJv48LYyN63EkY+vrc7mLl1QwyLFDSt09BABE=;
        b=GkBIoKjc1e43LlWa7TNCJ7IpKnTHlwwEa3jkoZrmiZ9qWB5osnpo6PUMD1Vb3bV8wU
         MBmOYxidHKjdfsol/joXC/MnPv5cALhwOvHLGb56s1MyJeZ+ytapgRXWPLfpulmemDVv
         8U5o/wdadn0XBlTdczr8kHGuqtLJ1POaRCDMgmR+UwjU/XuND/DJzSJXGusXn0lu+oew
         R62S1/YGimS4drXOR5/HbCuyp8CpPud9rVmzNdG27i4bkuLWDCRapBNBhWZGWynS+FrA
         hQEk57AIbi//TzVCeAdI5vRUgjhTpbg66Jzn7Pt3xH1eQH5kHNZSe8xVnCe68bMXQtLk
         Z7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=TsqHP2eJv48LYyN63EkY+vrc7mLl1QwyLFDSt09BABE=;
        b=VJm1/p0zpmol+mfhUg2e3MsaPvV7OApvYt0GhbYXn4E1DP2iXkhnA5CnoIsouce2tB
         jyM3yBdSqi8DDOISjtsCsN4qzx31dgN4w12R/n+zXOhniKh0QDZuqtWVVcZmEk3yN7eR
         ErEHye3ZsLTCH3VkSzH3HB83R70SalmgYJPxeog7vCU7oTpYkb/eoNbhh3D6iiFU7CU9
         GBBPksvvP9cK7+IvY6w3PLT/PY5mKIL0jH+zq3Mg/MvqbEL36ag9RRZ/rCckokIAbxLF
         YCe5YZV3edcD+f4eIiDvdl1V1DHMaQNkf3/Y6PJ2/UPYF50H7aXTNi+npWQKLLv8Rw96
         jKlA==
X-Gm-Message-State: AOAM530wM2HN1l8cGTobxmy58SqqDcffY6bH0okGKLecQ4psdCEgXfN8
        R8mccItV0xAeqw1YMpunAw0=
X-Google-Smtp-Source: ABdhPJw6DXSZZNibq6XHYzW2P3g7CK82QWS7dLMBk7ZilogCi/KmlHHuvxXegvoSY5Ax0jLybTtSsg==
X-Received: by 2002:ad4:46e2:: with SMTP id h2mr1287627qvw.24.1627495476586;
        Wed, 28 Jul 2021 11:04:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a127sm373933qkc.121.2021.07.28.11.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 11:04:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 28 Jul 2021 11:04:34 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] watchdog: mpc8xxx_wdt: Constify static struct
 watchdog_ops
Message-ID: <20210728180434.GC1663715@roeck-us.net>
References: <20210727223042.48150-1-rikard.falkeborn@gmail.com>
 <20210727223042.48150-4-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727223042.48150-4-rikard.falkeborn@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 28, 2021 at 12:30:42AM +0200, Rikard Falkeborn wrote:
> The struct mpc8xxx_wdt_ops is only assigned to the ops pointer in the
> watchdog_device struct, which is a pointer to const struct watchdog_ops.
> Make it const to allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mpc8xxx_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/mpc8xxx_wdt.c b/drivers/watchdog/mpc8xxx_wdt.c
> index 2f7ded32e878..1c569be72ea2 100644
> --- a/drivers/watchdog/mpc8xxx_wdt.c
> +++ b/drivers/watchdog/mpc8xxx_wdt.c
> @@ -118,7 +118,7 @@ static struct watchdog_info mpc8xxx_wdt_info = {
>  	.identity = "MPC8xxx",
>  };
>  
> -static struct watchdog_ops mpc8xxx_wdt_ops = {
> +static const struct watchdog_ops mpc8xxx_wdt_ops = {
>  	.owner = THIS_MODULE,
>  	.start = mpc8xxx_wdt_start,
>  	.ping = mpc8xxx_wdt_ping,
> -- 
> 2.32.0
> 
