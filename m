Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BABF44CE5A
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2019 15:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731706AbfFTNK3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Jun 2019 09:10:29 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41669 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfFTNK3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Jun 2019 09:10:29 -0400
Received: by mail-pg1-f194.google.com with SMTP id y72so1568958pgd.8
        for <linux-watchdog@vger.kernel.org>; Thu, 20 Jun 2019 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ECn4+/FK4TkxvJEDvJB3DljFzVUHw9Kt8PyfdG6tewE=;
        b=upVeVNaDWxPngrqUzoP2Uw7SQaaOJWMH2E3zOJYysjfCgi1PTQnAc5iW+2YNYT7lGa
         rEkIqck8xV4x6l7LnzzuRPAOyi6LTcS7lkdlD2yyoxvFWXZls+ktAiG1iPgj8s83IPFL
         cO2x+tXM5/oMzOENcVsUsYnpPEClbGeISKwSswCHSYdxys7pZMBZ+neXddF+VOy0wBYl
         OI652rH7QCxOUE9hptRObU803shQlJGxiPJrDd9/qwb1oEmCCpUshHIC5/Sof0ZdQvU0
         6eb9MN5OoCXcJ4oxgqFHSFEk2RL/YQLMYtrcblmWSU/MOAMDhAfBWtemXdtnBqeY3NPE
         O0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ECn4+/FK4TkxvJEDvJB3DljFzVUHw9Kt8PyfdG6tewE=;
        b=nADhMHQJ7ny0P7BQ66Z19ObfbsmC7go9WuF1mJ0W6xFpCLf6a/dJvNdReGLyEGtYmk
         KG8I0MVoR+0YRjY8qLOd5sGXp84zhUl/2V1pOvSOG5pKxNtPpegefr3SZ72FjzLWEfWE
         SqHl0XgnR2FSZfk1UlW1EgNZkzoJGfb9YNpyfW31utiD5TYBxl/G6TXfmPYxxsXpas96
         tcvbmr3sXwkgIh65bhEaYTjZ6WP2c5ViYHPsm91zR2cTNgV6cDWtCuaH+t15n0iIsWii
         XAARHCd1/yboEehg2mjrNR/k+pndRQouZ5vUBCbtdqbUtF3Pb4p0BWzMw8hE1emf6OMx
         PNfg==
X-Gm-Message-State: APjAAAXIeP3EZ9xE5Obfw6sdU754f53rhn9bFuQ1V+sIEKlZWdtDcIVB
        ATN494rh/L7CbEMsd62SzTmKgXYe
X-Google-Smtp-Source: APXvYqx3Yh+GKB56ZXY3SWRMwKqC7A6kUyl78laPLW83ypwyc/6fr09G6aDjgH5+fGlaD+9Y7rj4lQ==
X-Received: by 2002:a63:1208:: with SMTP id h8mr12369661pgl.377.1561036228154;
        Thu, 20 Jun 2019 06:10:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l2sm19927629pgs.33.2019.06.20.06.10.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 06:10:26 -0700 (PDT)
Subject: Re: [PATCH] watchdog: wdat_wdt: Convert to use SPDX identifier
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org
References: <20190620092213.4551-1-mika.westerberg@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <93edf424-69ac-6be2-5690-7e5ff88145f5@roeck-us.net>
Date:   Thu, 20 Jun 2019 06:10:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620092213.4551-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/20/19 2:22 AM, Mika Westerberg wrote:
> This gets rid of the unnecessary license boilerplate.
> 
> No functional changes intended.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/wdat_wdt.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
> index 430ee4e9b185..476f79ccb6cf 100644
> --- a/drivers/watchdog/wdat_wdt.c
> +++ b/drivers/watchdog/wdat_wdt.c
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>   /*
>    * ACPI Hardware Watchdog (WDAT) driver.
>    *
>    * Copyright (C) 2016, Intel Corporation
>    * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
>    */
>   
>   #include <linux/acpi.h>
> 

