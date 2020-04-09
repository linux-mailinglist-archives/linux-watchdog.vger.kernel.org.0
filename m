Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6FF21A2E94
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Apr 2020 06:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgDIEzI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 9 Apr 2020 00:55:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:44118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgDIEzG (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 9 Apr 2020 00:55:06 -0400
Subject: Re: [GIT PULL REQUEST] watchdog - v5.7 Merge window
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586408107;
        bh=UonjG6QFWHkB2RunWh9ZECoW4JcLBwSlMquupJB+kWg=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=l62spnOpavq7UYwElD/go9oblDKFBRoQG7dpU8xuWNzTw3qd8q0yI44y8mI856ksN
         rgthjc9Nm1es0q87n21H9PblJySO2Q97bJArPRaJWTRTPk/rtqyZSJmjhkA4hjrCq/
         Fd+xX9xPGAuwJaK+z9GfGzPAOH5nL51mARFE1ldg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200408092702.GA27984@www.linux-watchdog.org>
References: <20200408092702.GA27984@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200408092702.GA27984@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git
 tags/linux-watchdog-5.7-rc1
X-PR-Tracked-Commit-Id: 2d63908bdbfbce0d98195b22236ad5105dc6eba2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5602b0af9df02783df0e8fd9afc5dcadd38a3271
Message-Id: <158640810703.3202.13986052719432456174.pr-tracker-bot@kernel.org>
Date:   Thu, 09 Apr 2020 04:55:07 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Dmitry Safonov <dima@arista.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        Tero Kristo <t-kristo@ti.com>,
        Tomer Maimon <tmaimon77@gmail.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Wed, 8 Apr 2020 11:27:03 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5602b0af9df02783df0e8fd9afc5dcadd38a3271

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
