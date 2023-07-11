Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC0874EA49
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Jul 2023 11:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjGKJYz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 Jul 2023 05:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbjGKJW6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 Jul 2023 05:22:58 -0400
X-Greylist: delayed 76 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 11 Jul 2023 02:18:54 PDT
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186044496
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Jul 2023 02:18:53 -0700 (PDT)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202307110917344412b97ffd5413606b
        for <linux-watchdog@vger.kernel.org>;
        Tue, 11 Jul 2023 11:17:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YngbMRZ+I71xx4c0Kbc0TTwPMq+UjMpwaQWK/OE0Vi0=;
 b=bEGzPCEPXtDnDjTv9DCE1gCxAJD8SW7Pm763yj8b+3ajZkwxtTVzuwq6hlEhyyz8Ljk20p
 15tn1DsL3kibmjtLFuY3XFfgs9A/fUQ8jn5IurPXQaiRrR7jxl7CtD1Y/oQNGR3YeAGOEOa/
 xibJXbXzw2s0aGo9D/Dizh5HC4a9M=;
From:   huaqian.li@siemens.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     huaqianlee@gmail.com, nm@ti.com, vigneshr@ti.com,
        kristo@kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jan.kiszka@siemens.com,
        baocheng.su@siemens.com, Li Hua Qian <huaqian.li@siemens.com>
Subject: [PATCH v2 0/3] Add support for WDIOF_CARDRESET on TI AM65x
Date:   Tue, 11 Jul 2023 17:17:10 +0800
Message-Id: <20230711091713.1113010-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Li Hua Qian <huaqian.li@siemens.com>

The watchdog hardware of TI AM65X platform does not support
WDIOF_CARDRESET feature, add a reserved memory to save the watchdog
reset cause, to know if the board reboot is due to a watchdog reset.

Li Hua Qian (3):
  dt-bindings: watchdog: ti,rti-wdt: Add support for WDIOF_CARDRESET
  arm64: dts: ti: Add reserved memory for watchdog
  watchdog:rit_wdt: Add support for WDIOF_CARDRESET

 .../bindings/watchdog/ti,rti-wdt.yaml         | 13 ++++-
 .../boot/dts/ti/k3-am65-iot2050-common.dtsi   | 11 +++++
 drivers/watchdog/rti_wdt.c                    | 48 +++++++++++++++++++
 3 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.34.1

