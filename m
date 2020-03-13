Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D72A183F55
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Mar 2020 04:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgCMDNS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Mar 2020 23:13:18 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:36898 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgCMDNS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Mar 2020 23:13:18 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6BC0D8365A;
        Fri, 13 Mar 2020 16:13:15 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1584069195;
        bh=n96UwtAtVOCVHqBXD70o6APPLnkWO/O45cJLkbbT0Zk=;
        h=From:To:Cc:Subject:Date;
        b=zYw0NoNs3KaMnK/wxPgSGom2mI5TlMYTNANDEORO8JqI5TuPFN7tOtWdjhXTpTPco
         0KIb7U8dRwpdXPAfFJMYCsq/Cl3NXnt6Oxba0k50Ate5QcGBYET1ZqNZzEKqejCO+c
         fEBBELYKvHTzRrKErf3Cd+CzTrjFCt02swvv1xnDEsgqPZvSnDDr63IQ1vETkmft3z
         T9qbtXNup04e96UX/o09EnnD097e+j0f3M6zEf8qFVfjgsVkbXKDbe5XXIPIlvOnbR
         UuHIfy6mVrf8G4KUUO5hmAArBVi+PuOF6XDEgx2SfhD5A5V2Uq61Ld+EKi6ce9c/bw
         FIfQ2I4TQnvdQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e6afa4b0000>; Fri, 13 Mar 2020 16:13:15 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 2640013EED5;
        Fri, 13 Mar 2020 16:13:15 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 3498E28006E; Fri, 13 Mar 2020 16:13:15 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] watchdog: orion: use 0 for unset heartbeat
Date:   Fri, 13 Mar 2020 16:13:12 +1300
Message-Id: <20200313031312.1485-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If the heartbeat module param is not specified we would get an error
message

  watchdog: f1020300.watchdog: driver supplied timeout (4294967295) out o=
f range
  watchdog: f1020300.watchdog: falling back to default timeout (171)

This is because we were initialising heartbeat to -1. By removing the
initialisation (thus letting the C run time initialise it to 0) we
silence the warning message and the default timeout is still used.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/watchdog/orion_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 8e6dfe76f9c9..4ddb4ea2e4a3 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -52,7 +52,7 @@
 #define WDT_A370_RATIO		(1 << WDT_A370_RATIO_SHIFT)
=20
 static bool nowayout =3D WATCHDOG_NOWAYOUT;
-static int heartbeat =3D -1;		/* module parameter (seconds) */
+static int heartbeat;		/* module parameter (seconds) */
=20
 struct orion_watchdog;
=20
--=20
2.25.1

