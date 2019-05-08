Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51CFB16DFB
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2019 02:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfEHAHr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 May 2019 20:07:47 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45310 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfEHAHr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 May 2019 20:07:47 -0400
Received: by mail-pl1-f196.google.com with SMTP id a5so4026562pls.12;
        Tue, 07 May 2019 17:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HN68pgSokYWWKvinzUgVn1U1SddKsTL2kSGU6FODjf0=;
        b=bjfr/fPM+0H2SZXbx6TNp/DGV4zpmnTRSn1alUqvoJbctyEYK6nmlvvdUUTHsmHSz9
         +OhxAnrdDt0lh0w95+rJlQEFnQom0c4jDAAyl6H8reZeWtIpMV7unEF85hkm5THnttQI
         7mhELEV19lyG1oN/qF0Xthd2xh/7XBVJ1weoiskLIfrIrC5lBIYI6ppzS3nhsGaPVQox
         NaCZ1z/n+LANnboGjkUN1wnXjfxF/Q3Y4udAakxJDj3koat7LrHTBwG2ZuRQJfacDbAT
         BSPkOG6okSgfpuaZ6f4GxEbwC/kY3xFbxQ6zK4lMSNNMWQDjQDH5AIRvXVVpSCKN4hsB
         Y9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HN68pgSokYWWKvinzUgVn1U1SddKsTL2kSGU6FODjf0=;
        b=BGmXHnI7XVSAk0XZK1Btie3FXjC8VPpMJSpIYtcUi9tHKPRzsSF6fkx6kEf8hHFTfw
         oseo1xSMXMqmAHIDocsgf6eGFmO83Nh/OmNY1bDvUMMY67mOhXkw3VWz8Dl8LXJlgNip
         rQBQYPUmvpun53hcskcM3S8qGp0R8ftgGqlBVd0Ly/rV7jlPOqq81wywm5QHO7lqF53y
         3NPehbpQdXdE7oa3+1oaPuUUYNc8mP77Jm+ZMLdNXXTTZER9lGwwnQ6PrBDf3u2RUGFq
         4FHtcIRJrB5dvMPMCN81FtWicsy/PWBIIDkdta1ggRraeJxIjYyWHKcS+oK++VmhQ3I0
         nmWQ==
X-Gm-Message-State: APjAAAXairzAIr/b6v/e2Ik2MobrKJYHfOIzENPrzu9gnldq/GjfIz4G
        DALGMGdnWmQUhzhg9/YGxbE=
X-Google-Smtp-Source: APXvYqwfTg2fF7e7jMIli0z/0adeHhQWjX/dtytTySV8YZfOK/KeUo9PmzbmXzrbi1jkW3Ra3vv5JQ==
X-Received: by 2002:a17:902:2927:: with SMTP id g36mr41998203plb.6.1557274066589;
        Tue, 07 May 2019 17:07:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r18sm19170613pfd.89.2019.05.07.17.07.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 17:07:45 -0700 (PDT)
Subject: Re: [PATCH] watchdog: fix watchdog_pretimeout.c build error when no
 default gov. is set
To:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Cc:     Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <ec5a2b04-2649-e527-bcfd-4e708808e681@infradead.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <aace995d-a076-2fc5-8456-1e2638e4faa6@roeck-us.net>
Date:   Tue, 7 May 2019 17:07:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ec5a2b04-2649-e527-bcfd-4e708808e681@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/7/19 4:33 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build error when
> CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC is not set
> 
> Fixes this build error:
> 
> ../drivers/watchdog/watchdog_pretimeout.c: In function ‘watchdog_register_governor’:
> ../drivers/watchdog/watchdog_pretimeout.c:139:26: error: ‘WATCHDOG_PRETIMEOUT_DEFAULT_GOV’ undeclared (first use in this function)
>    if (!strncmp(gov->name, WATCHDOG_PRETIMEOUT_DEFAULT_GOV,
> 

Ah, I knew I missed something. The following would be a better fix,
though, since it enforces that at least one pretimeout governor is enabled
(matching the old code):

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index e19960ace0c0..4a3461afa96f 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -71,6 +71,12 @@ config WATCHDOG_PRETIMEOUT_GOV
         help
           The option allows to select watchdog pretimeout governors.

+config WATCHDOG_PRETIMEOUT_GOV_SEL
+       tristate
+       depends on WATCHDOG_PRETIMEOUT_GOV
+       default m
+       select WATCHDOG_PRETIMEOUT_GOV_PANIC if WATCHDOG_PRETIMEOUT_GOV_NOOP=n
+
  if WATCHDOG_PRETIMEOUT_GOV

Can you send v2 with the above, or do you want me to send it and give you credit ?

Thanks,
Guenter
