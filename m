Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E562F7CB91
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 20:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbfGaSL3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 14:11:29 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44524 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727489AbfGaSL3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 14:11:29 -0400
Received: by mail-pg1-f193.google.com with SMTP id i18so32442446pgl.11;
        Wed, 31 Jul 2019 11:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JvYvhDiPaCIW5VmxmJ3o1cy2k11J2KtTRWriR4fKGI8=;
        b=QhF+vM812ch9+tbD5gapQJwXqkf0ciegoiZk9ZhO70PebTP/9Fq+cdew/+wZcNc+2B
         LUVI+sWy/xW1M+phBuu6jVxT7qT06D4Fi8S0kkjHsRiJE9xoVFXFwWTht1v7dm7Zyyr5
         hyMQ5UudpGr16NjyJF8jMc+jA+5wJb70kXeM4X5YBGVvWPc1TCI2fDyTFTjzACDqnPyX
         0GMhrXlmLnvfCyYbY4CuSVd3XfVhQdGnCTOTJjDPprD863KKfVNcay5iQHVrktDnRziD
         eUv849aEAPuWJTvneW1WjSujOmcfFsr1M+G0VLmnG34fMYmDbATQ2z+I8LDc3bCP2Gho
         Pt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JvYvhDiPaCIW5VmxmJ3o1cy2k11J2KtTRWriR4fKGI8=;
        b=n7zaL8nJ9khHf9mSLhm2IJKBvQn4P7C6mjfRlxkg8KQphCrRTviCSO1FGfAGua1f2/
         SIRY4P1gS8ZF/pI8d7AtqL0wNA5DocWrhfAkpqA1UkYcTesmV10nRWIwsEvnqik2chOq
         T+SqvIn6BDPIjqqpUEL6MnpBhyPs81L8p+yyj/XAqNqyJbgpTGjv/fgBKUIqzxxuvbD8
         wq+AWICREAohtqgIMCw4HwhoEMeUWnveTtpv+Xp03Z33iGPLlrrUoDbJlUp0bmUPLqVl
         ifcLka92IzHEwh16rQEhq3Jp2rOtmaI/lDh1HQ5fgHmVhX4sC2+HmEzjyvmDIRNud7Fk
         6PHg==
X-Gm-Message-State: APjAAAWbXCwhYI1pPKvHvw+lkHb8GdDKznvnxNzAgFhGTZcIhXuJ6mnF
        C+/RF08PvREo+RpVAeUFrnA3TP1q
X-Google-Smtp-Source: APXvYqyCecO8bniHHVk3kYWQ1FzZYTdzMF4sNFMT/AOcbO3A8PBKQIZrt7VyqOT9MQy/Y/24rvezTQ==
X-Received: by 2002:a17:90a:2768:: with SMTP id o95mr4188079pje.37.1564596688426;
        Wed, 31 Jul 2019 11:11:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i126sm80877307pfb.32.2019.07.31.11.11.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 11:11:28 -0700 (PDT)
Date:   Wed, 31 Jul 2019 11:11:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Ziirave_wdt driver fixes
Message-ID: <20190731181127.GB3885@roeck-us.net>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731174252.18041-1-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 31, 2019 at 10:42:47AM -0700, Andrey Smirnov wrote:
> Everyone,
> 
> This series contains various fixes/improvements for ziirave_wdt
> driver. Hopefully each commit is self-explanatory.
> 
> Feedback is welcome!
> 
> Thanks,
> Andrey Smirnov
> 
> Andrey Smirnov (5):
>   watchdog: ziirave_wdt: Add missing newline
>   watchdog: ziirave_wdt: Be verbose about errors in probe()
>   watchdog: ziirave_wdt: Be more verbose during firmware update
>   watchdog: ziirave_wdt: Don't bail out on unexpected timeout value
>   watchdog: ziirave_wdt: Log bootloader/firmware info during probe

Since you are touching the driver, I would suggest another change:
Use devm_watchdog_register_device() and drop the remove function.

Guenter
