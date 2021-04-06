Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6EBC355345
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Apr 2021 14:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343803AbhDFMLT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Apr 2021 08:11:19 -0400
Received: from mout.gmx.net ([212.227.17.22]:58715 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238665AbhDFMLS (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Apr 2021 08:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617711038;
        bh=fthXQXzWvCMySNmq6wm38LQ0LqGN8oEvRSStBerzpuU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Xg/9ts60YSdd3/C6in+KG15rIxD4RevfSm7iAB+WGopCwxYxMZiXl2IK1QKl6k5C5
         yv77tCYEnAa/kCNd5KLxQCOidFJcYid9BL6Q+1DIMI4H/Rj994JcnduqGnH+E7DKSX
         8V1W10IJn/+YflUWxZOfI6oM4q1Szrfk/sea5Hws=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpSb-1m5ZBs3tFp-00gKMF; Tue, 06
 Apr 2021 14:10:38 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     openbmc@lists.ozlabs.org
Cc:     Tomer Maimon <tmaimon77@gmail.com>, Joel Stanley <joel@jms.id.au>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Rob Herring <robh@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v2 04/10] dt-bindings: watchdog: npcm: Add nuvoton,wpcm450-wdt
Date:   Tue,  6 Apr 2021 14:09:15 +0200
Message-Id: <20210406120921.2484986-5-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yIfwVUR13YRMBQna2k6oVWyExk6FvAxtgtrGA4cgaIZWJEAyBsI
 0UqJFDwJUzYg1OvkIDG0+uOrS1WoglGzfKeTZEf4fuEXfRxNezopYkZxk/5qo9B6GYRzJyk
 To7zZlSI2G6+kdkXEF7jIXxeN5jJpw0AI4KjQaHmooLPBbY/hVMeiLt8DKmb0fXZh9P1q0D
 D2RJZwP5tPENqwcDztg2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K6urnD8rZBc=:mc+8NA74aIxaTrKe389mGS
 wdioQ6Z6T/vZ07iTlnFwrTrxZkqIHt/akxC22dzsbh5LVgaa3l0eACbCnGoGiVvUq0nnbCNY4
 OAETS0BMrMdxd7K2FcGJKoGAprFI/QRuPFqtdxpuQ6PKCU83jfDL6NWHBF0f3ly1V8Uz7DFAs
 5tNPlq/reQTqn0MIkHZsw1EsXeVzV4VIZohB2qfqg5pod96Ksl3vEH43+W9ZjvxQvwoNi4tlX
 U+saA1H5fzScXroD891bDDk+o8wLIaFTbcPMAHBulwXHAqg38Fi1N3dO7HEkNY7SHv9uXLmOJ
 XIWfpp+cbiysY0R36kft+xDJtpAEmp/8neH2j3NzGr2F2y7Q8Ap6G9VP0YZi8GUkFIKt/AQix
 YJ52WfKtDWHWORUU7qENYT2Yz9bTau8y8e6zOz6CIS/jH1yth73nPzBc06jH4dSVGQHToUvQT
 gFMsCFVzuvbkQd1+PmmGEda4ciheKtizSTzWDVe+IvBkna0q0x9x6jXwAjO5Vknio/kk57wOL
 +F42aC4juHreCl2kuBSwujUzC5sCE1zjkNjbE89d9D+4cyl+pAXb8mNVzuUtQRRDPXLkanmha
 HzPe1e0OQund+QAyIl/H+oKZh8mICimYtSDkx7vh1uoEZ3VGhb6nRJH8TxO5yD+O9qlthNRJY
 jvO642QpTzveTkh5fngje6e5Q//dlhcYJY4dZi0HwE9X+P3YZbOJmHl7segvt0Fz5q90lzpaJ
 VkGWUI6y2d/e7KrcDc2Xwt4ANyt+zrpdSEkSW7HgnFsMLXKWgseZAJuiuiLS6OW4tOiVi+mxm
 HLBL6QdvTI2j5NF7oniKqfCW+T8ghm9Rm2KV05yQvVcqRKBw9qVjJ86zOHzt4DBeoVH6a5lnm
 qWNpsChrD18TUx+aJuT6dhunxPDOKabhxjpBdOKWp4xsZ+WFO/Fx22vI63RsCCfwoEHvpZvy1
 vkvjkmglBmVBcYefGDHNM9YsPnDK8uKfUCLvX3HaQuP0ExZ47FbFqb5vCjhJ9dK/6gXHEUO0E
 XtTIXUCeHVtsU+XFPkCp6FzxhDnLg/5oeElZwuc9Ihv3IN3+W1Q/9AVaFroAaKLGJ0B15t1hQ
 U1qiL7PTdES7/Cgle7QCWeYtrkF+ukkBirdQUhC+sGSMGYz5KE6Rybb1Dn6va/Ef3RXFLmgc0
 3n2FMuXXZotJPhtojWEcyYCSgJ5b+OIE51iNcZraosYxUilxQZNAaOXRykJiGHD/KbRhIZkrW
 3C8fliv3l88cHwtk5
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a compatible string for the WPCM450 SoC, which has the same watchdog
timer.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Acked-by: Rob Herring <robh@kernel.org>
=2D--

v2:
- Added Rob's ACK
=2D--
 .../devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.t=
xt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
index 6d593003c933b..9059f54dc023d 100644
=2D-- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
@@ -5,7 +5,8 @@ The watchdog supports a pre-timeout interrupt that fires 1=
0ms before the
 expiry.

 Required properties:
=2D- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg).
+- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg), or
+                    "nuvoton,wpcm450-wdt" for WPCM450 (Hermon).
 - reg             : Offset and length of the register set for the device.
 - interrupts      : Contain the timer interrupt with flags for
                     falling edge.
=2D-
2.30.2

