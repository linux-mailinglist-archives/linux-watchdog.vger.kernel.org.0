Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C173FF77B
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 00:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347923AbhIBW7G (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Sep 2021 18:59:06 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:42679 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232013AbhIBW67 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Sep 2021 18:58:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 59A9E2B0005A;
        Thu,  2 Sep 2021 18:57:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 02 Sep 2021 18:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=f5sIot3dUI0Gj
        qOCyRSsRyAJAba/SV49jrPM4q6Rp/E=; b=ik4mXYAj3UoCnnP1OIK7z9tpeGLUA
        fj3wZcwWw97vPZG+AIkasSFVsv8f+QVYQTPxGhU+WHbXihDfmt6KI4sv8DyXbVF8
        SV37AZir1skX/6ZNFZ/Mk8OqlMM98m+RWuAeeMUT8I81IBP6Ouqc5FRe5r0ybuIW
        fjUCVcd83kEtVMEE+Vj37s4YVSarkwnMrbhh42yFwKnWT8pH0bGGVyT+BBGbAhoS
        wPMKw/+b0r4a2ujNcvZJyMmlYbSdulBSbZBG/PlLuAe2xgTZDEgyvh0e+WkSDpL4
        vYD8zXkHv70EG9odVkIr03xfydUH1RQrm+FhkZL4HdHuWrKojbFXLrx3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=f5sIot3dUI0GjqOCyRSsRyAJAba/SV49jrPM4q6Rp/E=; b=lBbkYHfq
        FzpKdhoERU1kt4e9K0Rwm9l1TFIt71311koRG4CHNV1DIRtYyKoNmnMGttcaHBvd
        TLNA7E+MB9EkmiQDcGMs3R2h5i/OeKoIPwPD+TWENQhmJtOOneSW41amjZK38gJ6
        Bh/Z+sJkALT+o9rPfXYS9YA9VsZRgzhB6uy6+LzIluvVh5LD+al6wHEH/pQ7BO8Y
        05R75EOZGVRtpadAjCRwzJiTud5o378WtpHnUkmA/0j/xTTbwyZvkE+L4a6DClec
        dE7ddZrbqrPNWM3+NPZ46My2xyxv0cUUzb971Smfid4p+7+fU5l59oy6MOwVG8a1
        5QBjLjI5M471mw==
X-ME-Sender: <xms:9lYxYcxuPTL2LURfzFZD60UV-kdDRJZZOHhpepyRwhcDrDCyHCGjsA>
    <xme:9lYxYQSRuekyDSTfv0Mwb0qL0vJZrvFtoujljJlq67bD78aptLzKKn0jSAuhr49t4
    gjV_qbdcU3cf_4gNQ>
X-ME-Received: <xmr:9lYxYeWuXFtrCiaP6cOMnoVnQzRzr19OH_EWaO-GkdPV6Hhm_hAzPg1ceec6lr-jORRT54n3ix-sWYkHUIVskozqZUZH43LqEasJMKU99R83Udq5rer8_tEupORGLajSHG1K2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddviedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:9lYxYaihl0HyvBfSYVNSVifF7LBoApb2tKCDPE_p563q2U_hyHHoRw>
    <xmx:9lYxYeCI8Bs9ICxJSV4KGbxOLDmhSeOgzTIDcuC-x3wAW01F6z3sxg>
    <xmx:9lYxYbIjyu8BDOoZ-oqXN6qUtpdXYEOdaoG10HkBnLsdRR8Bfthm-g>
    <xmx:9lYxYfKG2KG4WQ7wyZmhZRpCZusawjLPU3_1wngLv-He4M_24_tKm2_SntA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 18:57:58 -0400 (EDT)
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
Subject: [PATCH v3 2/3] dt-bindings: watchdog: sunxi: Add compatibles for D1
Date:   Thu,  2 Sep 2021 17:57:49 -0500
Message-Id: <20210902225750.29313-3-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902225750.29313-1-samuel@sholland.org>
References: <20210902225750.29313-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

D1 keeps the same register layout and clock sources as the R329, but it
adds a key field which must be set to update the watchdog's "CFG" and
"MODE" registers. Therefore it is not backward-compatible.

Similarly to the R329, the D1 has three watchdog instances, and only one
of them has the "soft reset" registers. So that instance needs an extra
compatible string.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes v2 to v3:
 - Add additional allwinner,sun20i-d1-wdt-reset compatible
Changes v1 to v2:
 - None

 .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 877f47759814..44cad9427ae6 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -30,6 +30,10 @@ properties:
       - items:
           - const: allwinner,suniv-f1c100s-wdt
           - const: allwinner,sun4i-a10-wdt
+      - const: allwinner,sun20i-d1-wdt
+      - items:
+          - const: allwinner,sun20i-d1-wdt-reset
+          - const: allwinner,sun20i-d1-wdt
 
   reg:
     maxItems: 1
@@ -62,6 +66,8 @@ if:
     compatible:
       contains:
         enum:
+          - allwinner,sun20i-d1-wdt
+          - allwinner,sun20i-d1-wdt-reset
           - allwinner,sun50i-r329-wdt
           - allwinner,sun50i-r329-wdt-reset
 
-- 
2.31.1

