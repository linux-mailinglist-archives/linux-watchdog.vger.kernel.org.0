Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 671B550B286
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Apr 2022 10:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445444AbiDVIGA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Apr 2022 04:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445443AbiDVIF7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Apr 2022 04:05:59 -0400
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7A1527DB;
        Fri, 22 Apr 2022 01:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=rwpmI405aL91duchnEQbP99H3yfe1UPXHbd9Vu/Vayg=; b=QIXmre30beWxx4rsbcS5WhYA5l
        I27zSviwbbyiPRFMveb95lxOjLP2ufFsEASx53tRMgp/9HdCUORWOcWoKnb4rX2B75N0EvSeRVTph
        4uRQ+GLvsuWFcl5fBgC2qksWyfjmz7KyRcC35eZ8rAg2yVfdj22N2ihIzN9J+NN3TpM4VC561aAlu
        aR7Rucv1zX9ii8WcqrZCgdAWVzwbHfuzMtVaW5AK4fmnuYewPZGpP1PoXeXhvlOaYE74IngljnMxx
        7SlNZf3VG2Qu4UChVraVD68j9b/Zkl7fGpaI+Xb8IR9qmLI4fpOuQX6vTtc5gviMuxjnyfCVCLWzs
        FfAxsm5g==;
Received: from [89.212.21.243] (port=36186 helo=localhost.localdomain)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <primoz.fiser@norik.com>)
        id 1nhnh3-007P6W-45;
        Fri, 22 Apr 2022 09:27:12 +0200
From:   Primoz Fiser <primoz.fiser@norik.com>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Primoz Fiser <primoz.fiser@norik.com>,
        Andrej Picej <andrej.picej@norik.com>, upstream@phytec.de
Subject: [PATCH 3/3] ARM: dts: imx6: phyFLEX: disable da9063 watchdog during suspend
Date:   Fri, 22 Apr 2022 09:27:13 +0200
Message-Id: <20220422072713.3172345-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422072713.3172345-1-primoz.fiser@norik.com>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If DA9063 PMIC is left enabled during suspend, PMIC's watchdog needs to
be disabled before entering suspended state to allow board to sleep for
longer period than the watchdog timeout period. Otherwise board will be
reset by the watchdog. Thus disable watchdog on suspend and re-enable it
upon resume.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
index 1f2ba6f6254e..56b29c3294c6 100644
--- a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
@@ -212,6 +212,7 @@ da9063_rtc: rtc {
 
 		da9063_wdog: watchdog {
 			compatible = "dlg,da9063-watchdog";
+			dlg,use-sw-pm;
 		};
 
 		onkey {
-- 
2.25.1

