Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B7443E745
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Oct 2021 19:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhJ1R14 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Oct 2021 13:27:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:44094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229689AbhJ1R1z (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Oct 2021 13:27:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6755360D07;
        Thu, 28 Oct 2021 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635441928;
        bh=XNvKpSubjI18Iqb3M+gB63T0pQV8JXO3XL28m56caV0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=RtMGeRQlHfL/M4YhHLtQE6BrXHLHSqM9XZSmVCqzkcdfL3XCLAZM8V239UQipBkwM
         zW2U+C4Oos4EsMPTm7N6ZWxPs3lYhhe1CnUPm+ompkOfTRCPQrl+1SfnBgjFF9uRtB
         ZD72SMjDhNknS46RDl7b2sxVTPRxVXedkrePlO8UviiBGeOO0EeKwq977lnu8SNYA7
         J0qubvxsclIEfiISmyINEIp58ecHgiTFPotNlhpKwfDtmKmjaIC6wfkK4x8Rpn8YWu
         HQRlFAly06LVnHJzIDsKwHUznjgKpWqJA2z81Ftueg7oZPYisr/cG0awtyoCz0CNns
         TUjMIxMDjXO8w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 595AE60972;
        Thu, 28 Oct 2021 17:25:28 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v5.15-rc7 fixes
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211027203333.GA4663@www.linux-watchdog.org>
References: <20211027203333.GA4663@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211027203333.GA4663@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.15-rc7
X-PR-Tracked-Commit-Id: cd004d8299f1dc6cfa6a4eea8f94cb45eaedf070
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eecd231a80a5d54afc5eb350fc890ab15350408d
Message-Id: <163544192835.14282.3977344802602649109.pr-tracker-bot@kernel.org>
Date:   Thu, 28 Oct 2021 17:25:28 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Walter Stoll <walter.stoll@duagon.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Wed, 27 Oct 2021 22:33:33 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.15-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eecd231a80a5d54afc5eb350fc890ab15350408d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
