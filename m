Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE4EDDF2D
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Oct 2019 17:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfJTPgZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 20 Oct 2019 11:36:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:42576 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726492AbfJTPgY (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 20 Oct 2019 11:36:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D727BB02C;
        Sun, 20 Oct 2019 15:36:22 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Wim Van Sebroeck <wim@iguana.be>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, Roc He <hepeng@zidoo.tv>,
        =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin@geniatech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: Realtek RTD1295 watchdog
Date:   Sun, 20 Oct 2019 17:36:10 +0200
Message-Id: <20191020153612.29889-1-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

This series adds the watchdog for the Realtek RTD1295 SoC.

v3 adds the missing DT node, previously dependent on an unreviewed clk series.

Have a lot of fun!

Cheers,
Andreas

v2 -> v3:
* Driver was merged
* Split off needed osc27M clock from clk patch series

v1 -> v2:
* Prepared remove (Guenther)
* Set timeout field (Guenther)
* Cleanups (Guenther, Andreas)

Cc: Wim Van Sebroeck <wim@iguana.be>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: Roc He <hepeng@zidoo.tv>
Cc: 蒋丽琴 <jiang.liqin@geniatech.com>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org

Andreas Färber (2):
  arm64: dts: realtek: Add oscillator for RTD129x
  arm64: dts: realtek: Add watchdog node for RTD129x

 arch/arm64/boot/dts/realtek/rtd129x.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.16.4

