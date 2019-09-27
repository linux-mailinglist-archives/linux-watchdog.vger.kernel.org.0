Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDA54C0B67
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Sep 2019 20:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfI0SkF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Sep 2019 14:40:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:43428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728305AbfI0SkF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Sep 2019 14:40:05 -0400
Subject: Re: [GIT PULL REQUEST] watchdog - v5.4 Merge window
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569609604;
        bh=9OyxnTjQpqScF7V8SKV8Z2cLmG6H6O4h7uV6BJp5KGo=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=YiLMLKzuSI48fx+Ejaw5a0opYY24rvGeOy/rZptuskg8ElYIEeYPjC2LzfbDaeNiN
         PqbaiyA5U6ZUPaKPTkGnftfwmu6sbn32lOX9Ya/JHXD3UXiyX4yogLeN4FU0T2VCpo
         3K+51QhUVa13aktAJjljA9ovxmaZahZHV3Ik7HDc=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190927071527.GA14507@www.linux-watchdog.org>
References: <20190927071527.GA14507@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190927071527.GA14507@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git
 tags/linux-watchdog-5.4-rc1
X-PR-Tracked-Commit-Id: ca2fc5efffde5a3827adfb0ab6a51b6f1c64d5ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7bccb9f10c8f36ee791769b531ed4d28f6379aae
Message-Id: <156960960460.11345.6537445889071016679.pr-tracker-bot@kernel.org>
Date:   Fri, 27 Sep 2019 18:40:04 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jaret Cantu <jaret.cantu@timesys.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Ivan Mikhaylov <i.mikhaylov@yadro.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Fri, 27 Sep 2019 09:15:27 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7bccb9f10c8f36ee791769b531ed4d28f6379aae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
