Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67C92E22D9
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Dec 2020 00:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgLWXmB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Dec 2020 18:42:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:39384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727012AbgLWXmA (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Dec 2020 18:42:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 02F2321D79;
        Wed, 23 Dec 2020 23:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608766880;
        bh=xmMk6t/Y0Hs1WsIXbGW+WhVtvvSi3xAZPRQ0JWzoz5k=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=YNChb6fK/UJt4omIdD3u6k7Rk7jguDiyYPF7z6K14IA/XCO2heEGKe7pKBc2JAYru
         UneTz+D8opvI7UccZNXmpn7y8XCd2fhY7JwaMMfbldAflXmSJCmoEBzPzLQ2DDLe/z
         LmvJfVVQvuo9RcEETgtOU776Px34xDKqP+lkl78Sk9kS42a1eWVALZRF5mkYsc4bMa
         TlA2TUrBtGYjWc/x1xmZj43iccplHXRSpiRduKVQVxkMPXJyD0ZleK6Urs83p2KC52
         fYuLlmBUcC+ceyTOFmJoD04H0IU++WBsvlt773SbdLFxcHLkhsf7qRmzAUfGXslyb0
         //BreXOEQrFJQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E14C8603F8;
        Wed, 23 Dec 2020 23:41:19 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v5.11 Merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201222163452.GA1524@www.linux-watchdog.org>
References: <20201222163452.GA1524@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201222163452.GA1524@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-5.11-rc1
X-PR-Tracked-Commit-Id: 0b9491b621196a5d7f163dde81d98e0687bdba97
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6755f4563144e38f375f43dbb01926fd4ce08620
Message-Id: <160876687985.7832.2291710904978088213.pr-tracker-bot@kernel.org>
Date:   Wed, 23 Dec 2020 23:41:19 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        EnricoWeigelt@www.linux-watchdog.org,
        metux IT consult <info@metux.net>,
        Etienne Carriere <etienne.carriere@st.com>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Johan Jonker <jbx6244@gmail.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Robert Marko <robert.marko@sartura.hr>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tom Rix <trix@redhat.com>,
        Wang Wensheng <wangwensheng4@huawei.com>,
        Wong Vee Khee <vee.khee.wong@intel.com>,
        Yangtao Li <frank@allwinnertech.com>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Zhao Qiang <qiang.zhao@nxp.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Tue, 22 Dec 2020 17:34:52 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-5.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6755f4563144e38f375f43dbb01926fd4ce08620

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
