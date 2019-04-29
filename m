Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55467E7F0
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 18:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbfD2QkR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 12:40:17 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33015 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728520AbfD2QkQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 12:40:16 -0400
Received: by mail-pg1-f193.google.com with SMTP id k19so5424696pgh.0
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Apr 2019 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/pCLjtBJxxkhH4ZWDBLUE5wcjD8HsLkfgQ0ydZmgv6w=;
        b=WKvhOJV0Jvz+O9Bzzwcb/AQmAVqB92BKO5+hLzgka0Fu+ctb4gM4HwLwE84EDhpZPf
         BEq5+O/XSolc3ANPGm+GAXtbVpgbNqWVcQTrK4v4vfIy+aa9jxaIsuzJTqooOE26ZckG
         TWh0belYjwe2NGaGIxuX7aFuAdxQ5lCMfoHPim1REd2KpOIXKeoNJhMGmCDcDwXSLchF
         9/ve/ySDeWSEIuGtrLKO5SnCKSe0PvSfbTy3ZZWjBKZ0otxDogMSwBwwV1dgxKBkTlGF
         sUQfaQcgZ/QM8hQJgByaLR/pGzU+76gT8G7HkCxbeGnfhhZQHV7wFb7qam5UXmVcTv/q
         paoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=/pCLjtBJxxkhH4ZWDBLUE5wcjD8HsLkfgQ0ydZmgv6w=;
        b=DNSuKSfDpbAH0q6Kila/AhaykJc1dBS188rDtoOE1qMNDiUGOL4Hj4QU6C7EaciOr5
         9lYkVoWm216cerz/g90BnLL+SvVTFjRg4b7JOPcBRYGPCxnbYE5q9puOwGqMQlicAqg4
         bkPs25QgAMGz8ph+qmJcWp0xD2tMHinkfk1JY0vq0O0vu8ONnoDkAOCdlC8kGfMjw4Pr
         bRNm5t9KwwmnXn+yoM2hZfMSReLbvryJrjqeIuyHWEqGWd5PbSuJQAlo7yO0ul31MhHk
         oGl+ttSi2EGxZDwtW0S8SZCLsjaRrrtA6nQOqCgjIhzn0r8W1BrnN2T0fK5c/j7qkS9g
         85Bw==
X-Gm-Message-State: APjAAAXyDtAIl+NiUa5eP+RqVgAC924H4u3CpNafAgiHkrxAdlj1Xmu0
        phIVQNQvTD6gAVlmQg7wExxk0zIG
X-Google-Smtp-Source: APXvYqwCAVADJPjvoWnelLXP42g6sq8yoksUoOq0ZOGl9v203o/PClZ4Q7Z4DzZVkIc2EMvR/aAUWA==
X-Received: by 2002:a63:f503:: with SMTP id w3mr56447709pgh.60.1556556016073;
        Mon, 29 Apr 2019 09:40:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 14sm12367489pfx.13.2019.04.29.09.40.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 09:40:15 -0700 (PDT)
Date:   Mon, 29 Apr 2019 09:40:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/5] watchdog: npcm: make it explicitly non-modular
Message-ID: <20190429164014.GA14357@roeck-us.net>
References: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
 <1556034515-28792-4-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556034515-28792-4-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Apr 23, 2019 at 11:48:33AM -0400, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> config NPCM7XX_WATCHDOG
>        bool "Nuvoton NPCM750 watchdog"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
> 
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Benjamin Fair <benjaminfair@google.com>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

I'll send a different patch to make the driver tristate,
to follow the example given by other drivers for the same chipset.

Guenter
