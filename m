Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F991168901
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2020 22:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbgBUVKD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 Feb 2020 16:10:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:35676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgBUVKD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 Feb 2020 16:10:03 -0500
Subject: Re: [GIT PULL REQUEST] watchdog - v5.6 Fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582319402;
        bh=EAhw5aKVp633Mjlm8PjcZ587/Y5BkFMb7kGbuTm3fIc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=bMhZ1+x6Mfh9hG/nj0RCVK5RuI4vCTUD/LZmtP3stQYjgmchh6p+5mJRR3lKN6da6
         DX4RJcG74kpnv9VA3jAQYis81ZpikQb78fxwFcbcevCHdPW+4j4gsk8dQZotR/CG+i
         r046DkodS4Qj4xu/tlfamEvkSNOLUKFNzObVUipE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200221131549.GA13194@www.linux-watchdog.org>
References: <20200221131549.GA13194@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200221131549.GA13194@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git
 tags/linux-watchdog-5.6-rc3
X-PR-Tracked-Commit-Id: 44144c809e39d64ff9931c7e8956c42b2baa89e6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c0ddd6ae47c9238c18f475bcca675ca74c9dc31
Message-Id: <158231940241.18249.17078932166893961335.pr-tracker-bot@kernel.org>
Date:   Fri, 21 Feb 2020 21:10:02 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Fri, 21 Feb 2020 14:15:49 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.6-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c0ddd6ae47c9238c18f475bcca675ca74c9dc31

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
