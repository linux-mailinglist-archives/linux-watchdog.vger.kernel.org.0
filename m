Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A75244476B
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2019 18:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731870AbfFMQ7U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Jun 2019 12:59:20 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37890 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729830AbfFMA1D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Jun 2019 20:27:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id v11so9829584pgl.5;
        Wed, 12 Jun 2019 17:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EpDSf64rj6PYz78hH+AR6DaK1z0NFm7i5pZaO/Gviic=;
        b=NgHsrlbTYxNdyGFM1s8L+V3sV0kz7Ptni+sEDiDfDYRSld9CyU4/s2Nrl1vgq1kaxQ
         iHz98Bime2f4GUVt+n3MTjGkPwBBzUi+mF6CFqbO2Xni/JZBd/chbeKAeR0uAyOqTe2A
         oqT0A6x5kn8IFvFTmAo6pbnoqAc7wuVy7cNKZQvuAP1RpaNSG7SrYHCe4yWraw5x/VYV
         5gqkJvkbYEpCDD9i3K4eiwSSTkyb4VPnzjcQsyewU3OyB+JYdMMYaBkejiW+hjijnp32
         89EFw4U69OczjFytcejubn6E5bIIbOOUji6pSjnW3y+0yAc1Y7U2wMxFbP5xOpJQ26QT
         HVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=EpDSf64rj6PYz78hH+AR6DaK1z0NFm7i5pZaO/Gviic=;
        b=R8LL8TDQHiXaoqSACWw4+ipICsfPwpIL8AjwY4FM6t8NK0XahPMjlTTF5nzIc60jyJ
         AElS5CtB/coIWYnSgKsm2+zhReDLOJ0wUXZdd8Sx4rp4//Eq5rGQt4hs/8XRERMowRFY
         9yEhc6FfKjXHDeVZ+llbhrv2H6PD7q4vUvC4orWqx8MuZnmV3tQLJug3WPMpyFlzKsJW
         DcueL9Soyjq04HnlqZB6RYJPawOhTSH/U/D8R16zMUuvSPhhbwbvOTyyNET3StztY5OC
         Bbf4lDAZk/+dcVAm0PgdvJuLd3pL/MZjZmEvC7ks1prgqkSHRsvRZSPrtO50EM5IQg+m
         H3yw==
X-Gm-Message-State: APjAAAWdp7hv10H0wEtYv3hHh7/p2UaQwrXwczgLbi9QWZBVFJT2tmnG
        2uXCyUkl/Ag5o1f4v3c1BSIMuFBb
X-Google-Smtp-Source: APXvYqyB7RM/G2k2bMhnEpmalmqGJ/DDx/p41+9AOnqCyFNixMCv6VjnAJb6vS0oBQZx1a5ad97ALQ==
X-Received: by 2002:a17:90a:7184:: with SMTP id i4mr1883716pjk.49.1560385622887;
        Wed, 12 Jun 2019 17:27:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r7sm686664pfl.134.2019.06.12.17.27.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 17:27:01 -0700 (PDT)
Date:   Wed, 12 Jun 2019 17:27:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     wim@linux-watchdog.org, mchehab+samsung@kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: watchdog: Fix build error.
Message-ID: <20190613002700.GA1284@roeck-us.net>
References: <20190613000237.377-1-jerry.hoemann@hpe.com>
 <20190613000237.377-2-jerry.hoemann@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613000237.377-2-jerry.hoemann@hpe.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 12, 2019 at 06:02:37PM -0600, Jerry Hoemann wrote:
> make htmldocs fails due to missing blank line following header.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/watchdog/watchdog-parameters.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 01023382ea73..a3985cc5aeda 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -12,6 +12,7 @@ providing kernel parameters for builtin drivers versus loadable
>  modules.
>  
>  -------------------------------------------------
> +
>  watchdog core:
>      open_timeout:
>  	Maximum time, in seconds, for which the watchdog framework will take
> @@ -22,6 +23,7 @@ watchdog core:
>  	fallback logic in the bootloader to try something else.
>  
>  -------------------------------------------------
> +
>  acquirewdt:
>      wdt_stop:
>  	Acquire WDT 'stop' io port (default 0x43)
> -- 
> 2.20.1
> 
