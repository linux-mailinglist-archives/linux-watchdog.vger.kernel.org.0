Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0D44F929
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Jun 2019 01:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfFVX62 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 22 Jun 2019 19:58:28 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36890 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfFVX61 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 22 Jun 2019 19:58:27 -0400
Received: by mail-pg1-f193.google.com with SMTP id 145so5117874pgh.4;
        Sat, 22 Jun 2019 16:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lZUHpH2M+Wyx1Nixzo+rxEWVRPouZAupWhJLtRBuER4=;
        b=J+Qc6kFzXV9b/IP8VxIZb1nSUz8aJcZTeIw+r3UN1METyQW9w7rkYFTtp56KtdH7lH
         dv/f1e3OsdYTzUCOYAxPRRqAjAC1WERCoOVmaNwhVLBRsK2w7s0aC2H/PgTASU1glaGb
         doSeUQo478cuImKQX8AO4FRa/K2aLaIJ0gS9Bv78EaX/zEG3Ym0uJr2cwoKXzdFFtrzU
         ZSgYf9VmyhFjW73xz4JOErU0I+RjjDjFEGbmd2VXVoBnegagFdnA0UTeT4vJ+VbVZDKs
         Z8fuUo2uN4rQp1lI+W6KG521AyDCqpM+RDjnfFau9GmlvmL1E1o0tglE0OS9MbhmQUeI
         EIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lZUHpH2M+Wyx1Nixzo+rxEWVRPouZAupWhJLtRBuER4=;
        b=LfqLtCe0GbHkm6UGfZKwymUrXcyMSFNIKqKIuEzeWN1BiIfwK0X9TawpY6KpBHl1k0
         SfRBE3LCJu3wbAQzhtDlCKKsqI0KtsbGpZFqUFLyOyyWoEXO1fI6uTcMKvo1HvmoMeT4
         Ot/6sbHlToDqVrvru2By5zom4IpmMYrp6RgXDmWHd8JcHhcjnjBKqQUTNZXb8E+LF3zH
         0tD/RjUuMQnYCmxbQV6wxtk+uAlx4aVeGzCE5apxtFsmeFMspEKCYAozP5dSXiXqn0NJ
         K9Oe0E9V0lULdpdu8RFJwLJpnMQ9nMGFHhzhIJdSosywtrvEQ4ez0EzEDkvJZHD/U5NF
         B4WA==
X-Gm-Message-State: APjAAAVmVhXTwGjA0sAKU7NO8VJhQxZLI4vMIPVmg/wpXVrrwG2Fizdb
        /v56Qfnumy4RI874kGHORzQ=
X-Google-Smtp-Source: APXvYqyjw3Hl7M5bTbfpARaC/m/3jkVGHllSCS84kbpa2Q8bhzRaDSNMWuamR84mgLSgh3AETTooUQ==
X-Received: by 2002:a17:90a:2224:: with SMTP id c33mr15573423pje.22.1561247906433;
        Sat, 22 Jun 2019 16:58:26 -0700 (PDT)
Received: from icarus ([2001:268:c145:c721:c70:4af9:86e2:2])
        by smtp.gmail.com with ESMTPSA id o74sm10340916pfg.91.2019.06.22.16.58.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Jun 2019 16:58:25 -0700 (PDT)
Date:   Sun, 23 Jun 2019 08:58:03 +0900
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wan ZongShun <mcuos.com@gmail.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] watchdog: convert remaining drivers to use SPDX license
 identifier
Message-ID: <20190622235803.GA3286@icarus>
References: <1561048126-27578-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1561048126-27578-1-git-send-email-linux@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 20, 2019 at 09:28:46AM -0700, Guenter Roeck wrote:
> This gets rid of the unnecessary license boilerplate, and avoids
> having to deal with individual patches one by one.
> 
> No functional changes.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Note: Several drivers include a paragraph such as
> 
> "Neither <name> nor <company> admit liability nor
>  provide warranty for any of this software. This material is
>  provided "AS-IS" and at no charge."
> 
> Presumably this is covered by the GPL license. However, since I am not
> an attorney, I am not sure, and I opted for leaving such paragraphs in
> place.
[...]
>  drivers/watchdog/ebc-c384_wdt.c        |  9 ---------
[...]
> diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc-c384_wdt.c
> index c176f59fea28..8ef4b0df3855 100644
> --- a/drivers/watchdog/ebc-c384_wdt.c
> +++ b/drivers/watchdog/ebc-c384_wdt.c
> @@ -2,15 +2,6 @@
>  /*
>   * Watchdog timer driver for the WinSystems EBC-C384
>   * Copyright (C) 2016 William Breathitt Gray
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License, version 2, as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful, but
> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
>   */
>  #include <linux/device.h>
>  #include <linux/dmi.h>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
