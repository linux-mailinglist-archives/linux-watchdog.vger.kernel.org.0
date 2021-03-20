Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220D7342EF1
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Mar 2021 19:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhCTSX2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Mar 2021 14:23:28 -0400
Received: from mout.gmx.net ([212.227.17.21]:51021 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229944AbhCTSXT (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Mar 2021 14:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1616264581;
        bh=uf3ILqEMg6eC6bi0iqi0XBLwUk3OVexnnKIhLAryQMA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XQSlMn4kuzlmWcAPBTKcY67lkjpiViE/Ywb6X1KT8TxnpV9XuonTO4BtTZPuZ08C0
         DmYKPBbWUKs7bwa+QvYXfwi//OZ015z43XzBnr30seZ9QLJJtWyVUPMvQlffs/LI3f
         6dZ8dzAAmTUxylYkPFhrm2trPGNWkjvM4daMcfJU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowGU-1m1u272fwU-00qSea; Sat, 20
 Mar 2021 19:23:01 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     openbmc@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 11/14] watchdog: npcm: Add support for WPCM450
Date:   Sat, 20 Mar 2021 19:16:07 +0100
Message-Id: <20210320181610.680870-12-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hw/P9HKeJHarfyFvwAmBp8Mam8myqgk157QR4E1NS3d3ZRPHh/H
 GhkO1M1vo508nDI32ImNoSNS5SgJG7FY5VClPhFxCoreYZsR45skbp9GBBKhwqmUmgfoBVz
 sTiI8OCeoc2hxN1a728DhCADntRQ1yiuWQFkO9r8IxSd8aip1o1jrHkFONA/RapF7wm3mh9
 IJE4J2F1rdAFZJiZeVeqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FCi6tQaXMAM=:BIBUuG1s1Ud/UwrbI4Ckdf
 ERwviKF/Jvwbji+f4UwucR3cyzS9dMrkOouY85V8VL/xhrGEO9Y8VJPv8nSbTcVZAZYp4qEmh
 6Ferpmpi+sbujwnFtr9kQka+keSw1umI7NdtOBt2BLLrVKfQ93dBAJgQt6+WnOiKNMWWe6JDR
 gUCLVtL4+VYFagSlKTcZNJXUxqw67S6QwoMqx7TsD53/btMq2htkZbXhhmnDj6l7+R/rH0KXf
 x81M8y0hanZSvsDjFTG2kO7Pla5GrhgV418CqGyOFKyHiYtmm5jgfty9G4KFmJnt7Cg1P7Rs6
 k/FdGlYo5d2gU01Wp50GBoHffmu4dbUQvcjQZD2YnE7cxas2MIKo5aiq2XNKCzQX6td5K0KiW
 x0M/ShfHSjaIOnLGI3ZvPiudrYYrKDgE5LEdKm4EyrI44PugKSkkixzZE3jIK7Ok6/Ov0L9HQ
 Q/DXCs0+Pi0KckmadADFxdQ4FmJXmKqQ+FrG17d9bHMF5AJYo6o1wzUIL3B2S1QuMvDDVoPjH
 YkMAyh2cK6f11MjGw6FFs6esx5IqgVSCJ2oiVfkk9iRaIUG9Q0hW9FdX89wpiCFEMTi2/YglQ
 xfmDWJouZGxoU7hTo6FX9PHIWh/a6Z4WEW3eXroncdbeCIhV8xswYop+HsLphvjcMtlLmi4yS
 Qnszh2ZYQ1+632JkNj4iSAZMkUzNfk4HEcfoMNkR4Xwf//498NRZNJUfLE6PogreSdEwWPnzK
 6qCWCX5Lom4zfF02aGkynRVDtpzcX1/nBt/0N4F8SlHUKcqh+ZQREUhoeBjVJjVlN+jdQNY1k
 9z7U6PbtnxBYmVuOxLDj33FCnEdjim8XlCjUyV1ANP8J5NZYbCbZ/699HjxCsI08HnuVVBHbk
 ajFhmJKwCbsgp3VzyMmA==
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/watchdog/npcm_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 765577f11c8db..28a24caa2627c 100644
=2D-- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -229,6 +229,7 @@ static int npcm_wdt_probe(struct platform_device *pdev=
)

 #ifdef CONFIG_OF
 static const struct of_device_id npcm_wdt_match[] =3D {
+	{.compatible =3D "nuvoton,wpcm450-wdt"},
 	{.compatible =3D "nuvoton,npcm750-wdt"},
 	{},
 };
=2D-
2.30.2

