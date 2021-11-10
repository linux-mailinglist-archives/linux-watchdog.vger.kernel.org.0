Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5C344C627
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Nov 2021 18:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbhKJRrh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Nov 2021 12:47:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:60180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230380AbhKJRrg (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Nov 2021 12:47:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 00F5661213;
        Wed, 10 Nov 2021 17:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636566289;
        bh=vn3uXvDQxY6KuLDvN/qhIH6FRFwrX+CcyCFr0sDA20Q=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=cMnrOud0I2MRKInSu9H8LulKJgxJekJfFT+BxdemaKZU1xBd5lrbGjxzUImQBEnP4
         JLMhoB9gp1RueFnPBJUhUDalbbZS07MvURaQDfCTinmeJf/V5hvtE/Ml14ihTk001h
         aLiu9UW9WtmBTuIvhCgkoShKbttVxKR2tKVWiLno+sJ/qC14Omk8YuO3zTM3wp2PI6
         tU14BR+gjDt4OvBaRLuu6NF69EUdDUfHciZywQ4pcq2WnuRNj17cHGHGKS4mBBbKZf
         s0CUJls6CGQXZiWoGmYDZNmwBo7nANllQOCFWHOBHqp8Q+s1S+PLjBlcS4ccGBE+rC
         cyp/VCO+yDOYA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EBD1D60A89;
        Wed, 10 Nov 2021 17:44:48 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v5.16 Merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211109140540.GA29107@www.linux-watchdog.org>
References: <20211109140540.GA29107@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211109140540.GA29107@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.16-rc1
X-PR-Tracked-Commit-Id: c738888032ffafa1bbb971cd55b3d43b05b344cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 89d714ab6043bca7356b5c823f5335f5dce1f930
Message-Id: <163656628895.12313.12615101325644335709.pr-tracker-bot@kernel.org>
Date:   Wed, 10 Nov 2021 17:44:48 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Artem Lapkin <email2tema@gmail.com>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Fengquan Chen <Fengquan.Chen@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jackie Liu <liuyun01@kylinos.cn>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Primoz Fiser <primoz.fiser@norik.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Samuel Holland <samuel@sholland.org>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Tue, 9 Nov 2021 15:05:40 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/89d714ab6043bca7356b5c823f5335f5dce1f930

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
