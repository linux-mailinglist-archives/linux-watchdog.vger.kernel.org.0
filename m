Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6425D3FF776
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 00:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239414AbhIBW6y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Sep 2021 18:58:54 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:38897 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232013AbhIBW6x (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Sep 2021 18:58:53 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id B432F2B00053;
        Thu,  2 Sep 2021 18:57:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 02 Sep 2021 18:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=qq4KILFhNX+2NAhG1FBp30Jzcd
        dxrR8B8njvflWfJ6A=; b=KhShorhRUwKNfiawh29mCc5Sv+rnnfMFOqqAzye8/r
        tv2aNK9UoS/Q48AtWMqbmyxt2GQJsqm0qKOdMrT3o0eh6n7DoBVPDg+gNj6V+BGk
        tx9+MgUJbO3efNX+PCuABuuR6D/uQNaNim/14EN28dqpz4AQ4pZiMBa5BNV1vMlB
        4rfn1/cXzlrY+4fQnaA6V/0NxgA/hACqFGv6WuZ0511bTldm2OIZgNeGXp+eAoQq
        IQ9IMnfy97bVsGyDcdJ1agsLcX8dl+Bm9L92b7JmHeN1cy3r1ugc2UiIjxjQRZGj
        UyydlLz24SlPVST3oO/76/t2XNRtDnIamyvKziXt+JAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qq4KILFhNX+2NAhG1
        FBp30JzcddxrR8B8njvflWfJ6A=; b=YfpSJUlsU3ac/rsKwHUdmgZnaBmcSumEf
        dtP1E/xsAz3iapA8mYEE0HNqxAsEH2PlRmtDjNN51OGpr1ggrBHBTKeDXk8JwEd7
        vDEmDzyPRqfQMe78ZZpg3R/n+GD1M8CYN8ZdWVwOR3OZlWWCMC5mZZl+9dkCZFzJ
        rsTrde6b4LhJjCV4QF2Angai8gmdtf0Uut8XiMgftKunNvRv1QGiWh9L/lXJm570
        OLort5l+sUXwXu12T8e0RxpmOaD1b7+o4M50AwcDBRsU8FUmnsqCL/V1DIk1VG6y
        5oe3An2PJ1kJd/jPH/uF7bc+uNLTf+PVEwCs4ESXxjshevpDFVgEw==
X-ME-Sender: <xms:71YxYR-73ia2Hwla52-EYzCtHeJQdoMC5g33vOSmL3f0E66EfPtsNw>
    <xme:71YxYVuifVNyfZz1Ak6VjLSevtEwGqS7kM0k0GhMdkPZbjz1kf61ssw9Mm-tBSvo1
    y71TtCv6Lzkkvdghw>
X-ME-Received: <xmr:71YxYfA6oPnnIm1A9ZMHB-rF7Zt-RBnM61OWzILP6OYsQDNIEfqRYMK1OuBWPKfxc--GoaeurmLkomb4fJt-BXEDvCIkMhMWJCdNcb2kuYKGIzMSVdD47ZA-oW4oo2hazUe85g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddviedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeeiteekhfehuddugfeltddufeejjeefgeevheekueffhffhjeekheeiffdt
    vedtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:71YxYVckUPhwQ5xAJwnCdzEzPnRFh2XCcKI1a5nEhKSBIPZRHXxc6A>
    <xmx:71YxYWNnPengs6f9ne6TIukFYz3Qm2rdyPbDoPVWfUy_KXHJHCjxxw>
    <xmx:71YxYXmTMiRMiUFPSinOmgjV0xZmnPVlD_UMKf1vq7AiCgRYd_kKMg>
    <xmx:8VYxYXl2aAcVg8ONqX91NFi5mcFZBXRgcI0oMNbpGdCDH1B9jdJz7yjBkFA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 18:57:51 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 0/3] Allwinner R329 and D1 watchdog support
Date:   Thu,  2 Sep 2021 17:57:47 -0500
Message-Id: <20210902225750.29313-1-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This series adds bindings and driver support for the R329 and D1
watchdogs. The R329 is fully backward-compatible, so no driver changes
are needed for it.

v3 of this series adds two new compatibles, as I discovered that the
immediate "soft reset" functionality was specific to the watchdog that
is part of the same block as the sun4i timer, and is not available in
the RISC-V or DSP watchdog instances.

My intention is to use the soft reset function as OpenSBI's system reset
backend, so it needs to know which watchdog instance has that feature.

Samuel Holland (3):
  dt-bindings: watchdog: sunxi: Add compatibles for R329
  dt-bindings: watchdog: sunxi: Add compatibles for D1
  watchdog: sunxi_wdt: Add support for D1

 .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 48 ++++++++++++++++++-
 drivers/watchdog/sunxi_wdt.c                  | 20 +++++++-
 2 files changed, 66 insertions(+), 2 deletions(-)

-- 
2.31.1

