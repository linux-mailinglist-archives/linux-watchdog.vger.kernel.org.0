Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B60806D3F9
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Jul 2019 20:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391101AbfGRSaG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Jul 2019 14:30:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:49440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbfGRSaF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Jul 2019 14:30:05 -0400
Subject: Re: [GIT PULL REQUEST] watchdog - v5.3 Merge window
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563474604;
        bh=8L3YAQ+MHhbI9yfjQXTU3IP9TGV0wBqCEFFkC+HLkRw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=MCwgmXHlgBGaUOBcL0ZJPsS2Rw/9q0yD6KG/taycjjALlbb0EYas5tUeaebQ3Adbp
         p4B+WKyziNaRgft0oBE/p27eYxni091uu8puhcA/qruSRmaW4m8OAphGsBwwDhTump
         h7yIPIw4f48U81RYg+CAckgZBnc/G9PPsfHo6nqE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190717195828.GA25283@www.linux-watchdog.org>
References: <20190717195828.GA25283@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190717195828.GA25283@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git
 tags/linux-watchdog-5.3-rc1
X-PR-Tracked-Commit-Id: 7fb832ae72949c883da52d6316ff08f03c75d300
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d77e9e4e18ce9da3b4981a5c537979c42b06638c
Message-Id: <156347460488.12683.10471871917152605765.pr-tracker-bot@kernel.org>
Date:   Thu, 18 Jul 2019 18:30:04 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Ken Sloat <ksloat@aampglobal.com>,
        Mans Rullgard <mans@mansr.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Stefan Wahren <wahrenst@gmx.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Wed, 17 Jul 2019 21:58:28 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d77e9e4e18ce9da3b4981a5c537979c42b06638c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
