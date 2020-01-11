Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3790138287
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Jan 2020 17:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730382AbgAKQrN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Jan 2020 11:47:13 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33797 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730347AbgAKQrN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Jan 2020 11:47:13 -0500
Received: by mail-pl1-f193.google.com with SMTP id x17so2089815pln.1;
        Sat, 11 Jan 2020 08:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PrT/z7/QcgRp7HzvVg/dSsByVx/WL6L0i0y6qJMBrjA=;
        b=McZsbVfV527vavF6N4/WnAbDpTy4/VdpfdTOs9jzeRy2N4hARTx0hLH3u/5j0AloGu
         cQNOm4Rq5OqT1/9eo85FhOnRm2fTGqDHKimua3OVpFkZzUCys9wsM4jcBV9Xkw1uJlwV
         PkU0e6LCRs7dew5z/ltxrIa+bbfWtubOHEqQCC4Ox5CHBdlDIEBZJ4xjpn1wx5lgX8Zo
         jJSDP9oDMqb3sma3aYO9Rh6QFrfUbhgqHKVnAX6j9dUV0fHDfKjGWErmvZkPwri/KCE8
         jhmpq4pvaqUaVG96xUAGvCKeDJNsIZInMZGiDomfbZByJSCuxR0uhqTyETg8YnktzlSz
         Vddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PrT/z7/QcgRp7HzvVg/dSsByVx/WL6L0i0y6qJMBrjA=;
        b=NwB+E7Pe/K8FGJBGxHTin1zn/K19Zv22FPxvyVbJbB/g6dfuY/allRMEnDUZafEDgq
         WGD6/3lq0NHNtkYkC1RFnq5YsS/38y5E2UG0b+07V3gIhiJc9JMChlvFM21xUTQZXOcu
         ar5tGEKUX5P23mr+b6tGxblVLrzOFP02NCpUzllFXeK8getZhUeQf5HCvvrgeWJkUKRR
         JfA9jEZ3yZEhwDN7lkcTxf9XwewM8L/L6oNhlvh6z2duGWRL/9ifAt0bOx/Rh8gDdDao
         m0pfJ2st/IM9EOEo2VhCLdZijGoaTJwGvnM6YlDjkBLmg/RCt9QLp6IHl4N7PSobKO2u
         RjQw==
X-Gm-Message-State: APjAAAVDGIyAf0X9vqvsMpyZ3uUIeQTvPWp2XpRpiB0tsnTKnLYxt6cW
        Mf/lAwv8j8vwbymiO1XFZSYJfxdc
X-Google-Smtp-Source: APXvYqxSxC5wl0fKHukdALLUXbMHLjnDvfWNJX8Qv28W1kXKGHxzhdlltxTBd+/vbq3K2BdJS9ZUqA==
X-Received: by 2002:a17:902:59c9:: with SMTP id d9mr5551382plj.184.1578761232147;
        Sat, 11 Jan 2020 08:47:12 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 68sm7069241pge.14.2020.01.11.08.47.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jan 2020 08:47:11 -0800 (PST)
Date:   Sat, 11 Jan 2020 08:47:10 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        lee.jones@linaro.org, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/3] mfd: da9062: fix watchdog compatible string
Message-ID: <20200111164710.GA7295@roeck-us.net>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108095704.23233-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 08, 2020 at 10:57:02AM +0100, Marco Felsch wrote:
> The watchdog driver compatible is "dlg,da9062-watchdog" and not
> "dlg,da9062-wdt". Therefore the mfd-core can't populate the of_node and
> fwnode. As result the watchdog driver can't parse the devicetree.
> 
> Fixes: 9b40b030c4ad ("mfd: da9062: Supply core driver")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/mfd/da9062-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> index e69626867c26..9143de7b77b8 100644
> --- a/drivers/mfd/da9062-core.c
> +++ b/drivers/mfd/da9062-core.c
> @@ -248,7 +248,7 @@ static const struct mfd_cell da9062_devs[] = {
>  		.name		= "da9062-watchdog",
>  		.num_resources	= ARRAY_SIZE(da9062_wdt_resources),
>  		.resources	= da9062_wdt_resources,
> -		.of_compatible  = "dlg,da9062-wdt",
> +		.of_compatible  = "dlg,da9062-watchdog",
>  	},
>  	{
>  		.name		= "da9062-thermal",
