Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58AD940302E
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 23:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344914AbhIGVXb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 17:23:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:34840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243883AbhIGVXa (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 17:23:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CE1B761090;
        Tue,  7 Sep 2021 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631049743;
        bh=Cq5pTTVkFcKzGc0spQ9Osp3QQ6EbOWj5aydK3apxAv0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=QFxwk01jZrpnFm7eRyDfcnv2wl28tADolx/i9X3DYVyjIsE1wwWhyPNjqVaw+hX/t
         fWYa4yQC0kIx+u4EvxCBtjnTR9vKat5GoqsqnL8i45M+A/WXhA7c1dklrsU0ESs4Ab
         gkwICB25SVbFu1AKoa27IBMK/z3lAYE5Wv5qFHmIwp+brVwJ9CbwZG6oC36/CaY/NV
         5cVbntFKClW7MtsoTSxxlIoFw/Wh5EQ6zMusdMkB3E/Ai2bZ+yZAX102dKAi8uFPS1
         2LcizSHhAcGKe+k4bg+1DOT9n2EAoPBIfr2+c4RKpO5hpz++xqOiAzi+pBxCDzi5O6
         KOL0aNso8y+eQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B35E0609F5;
        Tue,  7 Sep 2021 21:22:23 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v5.12 Merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210907191139.GA18865@www.linux-watchdog.org>
References: <20210907191139.GA18865@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210907191139.GA18865@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.15-rc1
X-PR-Tracked-Commit-Id: 41e73feb1024929e75eaf2f7cd93f35a3feb331b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4c00e1e2e58eefb288ba9ef585b6f19e1f33bf1e
Message-Id: <163104974367.25074.3468919296051123154.pr-tracker-bot@kernel.org>
Date:   Tue, 07 Sep 2021 21:22:23 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christine Zhu <Christine.Zhu@mediatek.com>,
        Curtis Klein <curtis.klein@hpe.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Sam Shih <sam.shih@mediatek.com>,
        Stefan Wahren <stefan.wahren@i2se.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Tue, 7 Sep 2021 21:11:39 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4c00e1e2e58eefb288ba9ef585b6f19e1f33bf1e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
