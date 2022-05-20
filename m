Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 768EF52EBC3
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 May 2022 14:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349085AbiETMR3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 May 2022 08:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348999AbiETMR3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 May 2022 08:17:29 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3315ABF4C
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 05:17:27 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220520121725epoutp04bcd82b849f25f9054ba581aef8bc139e~wz1lMdVnc2610826108epoutp04n
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 12:17:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220520121725epoutp04bcd82b849f25f9054ba581aef8bc139e~wz1lMdVnc2610826108epoutp04n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653049045;
        bh=blhzHjIZTiUMQwM1SO4oVryfiBgLeX9m7MqZ7Oyr6AE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qc/OwUWrFWOwZQduMeGmayR9+wkFyjHXXB1LqkNY/Ai2Bfr+yvnLakowlxxsTJQjH
         BhowfA+246lny9SN1WR3TcuZNwuAKCFAIF0XAhMMHwFgqu42vMHYcBlixGs4PRNktY
         ghuWSYZ7aY1npGLHls6FFwpMrBA36NrFLqJ6j+Ns=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220520121724epcas2p40335b80688cce219405d28e663585196~wz1kF877-1928219282epcas2p4A;
        Fri, 20 May 2022 12:17:24 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.68]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4L4Qhg0bwNz4x9Q2; Fri, 20 May
        2022 12:17:23 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        C0.B5.10069.2D687826; Fri, 20 May 2022 21:17:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220520121722epcas2p359f331c9276eeac5d027b0fe068296f1~wz1iHvQhR2568025680epcas2p3N;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220520121722epsmtrp269cdb14737e837b49be01ab3a8b2d61f~wz1iFr9gW1007010070epsmtrp2a;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
X-AuditID: b6c32a45-a8fff70000002755-15-628786d2e389
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        2C.2A.08924.2D687826; Fri, 20 May 2022 21:17:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220520121722epsmtip200ba2f36a280a19d9461048c79dc4d75~wz1h8ij0S0065800658epsmtip2Q;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 1/4] dt-bindings: watchdog: add exynosautov9 compatible
Date:   Fri, 20 May 2022 21:17:47 +0900
Message-Id: <20220520121750.71473-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520121750.71473-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmme6ltvYkg0871Swu79e2mH/kHKvF
        3tdb2S1mnN/HZHFj3T52iycLzzBZtO49wm7xvA8o9vjlP2YHTo9NqzrZPO5c28PmsXLNGlaP
        nd8b2D36tqxi9Pi8SS6ALSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8x
        N9VWycUnQNctMwfoKCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFp
        XrpeXmqJlaGBgZEpUGFCdsbrKTOYC+5wVXzZtJm5gfECexcjJ4eEgIlEe9t8NhBbSGAHo8Sj
        fyFdjFxA9idGiX9PX7BAOJ8ZJZ7928oM03H66S1WiMQuRokn/a3sEM5HRokzm+aAzWIT0JXY
        8vwVI0hCRGAto8Tz5xPBWphBWjbf/8MKUiUs4C6x79J6FhCbRUBV4u6kSYwgNq+AncTc75NZ
        IfbJS2yY3wu2m1PAXuLvg7+sEDWCEidnPgHrZQaqad46mxlkgYTAT3aJm7efQzW7SDTcPMMI
        YQtLvDq+BeptKYnP7/ayQdjFEktnfWKCaG5glLi87RdUwlhi1rN2oGYOoA2aEut36YOYEgLK
        EkduQe3lk+g4/JcdIswr0dEmBNGoLnFg+3QWCFtWonvOZ6hrPCT+/roHDbpJjBKtU5cwT2BU
        mIXknVlI3pmFsHgBI/MqRrHUguLc9NRiowJDeBwn5+duYgQnUy3XHYyT337QO8TIxMF4iFGC
        g1lJhJcxtyVJiDclsbIqtSg/vqg0J7X4EKMpMLAnMkuJJucD03leSbyhiaWBiZmZobmRqYG5
        kjivV8qGRCGB9MSS1OzU1ILUIpg+Jg5OqQamjPq+ttubr+18pGWinejuxZRlbr4/YDVTiFdv
        4mX1zsTrNyPXLfL+xCZv3Zj1+eXmE+sydh+ucn124cHBqk+uHw6tkH5oKLDjYXfr9+aiw6df
        LXZ24imsUFr37L9tZVsI7+cna3SOB070yNLpzH4jc1767iWPGxuvNIi6TA7caTB14xbZiKWR
        7LGr9ZunhEYdy9J9XFCWrLanYfWanRdMr79f9Pjp6vzcS+Xx8+6pZS68+GBDsksZs5L1m70p
        M9vms/Zf3Cou3ti+V6M9h7u098+FFO5w+etPLoQ973+yq8Ai4PjOi31fPxw5ymuTEK695snB
        64ZlqjccYsq+uF85eFx+42/h3Y/nT+W5fO+JjhJLcUaioRZzUXEiAOfLQx4vBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGLMWRmVeSWpSXmKPExsWy7bCSvO6ltvYkg75uIYvL+7Ut5h85x2qx
        9/VWdosZ5/cxWdxYt4/d4snCM0wWrXuPsFs87wOKPX75j9mB02PTqk42jzvX9rB5rFyzhtVj
        5/cGdo++LasYPT5vkgtgi+KySUnNySxLLdK3S+DKeD1lBnPBHa6KL5s2MzcwXmDvYuTkkBAw
        kTj99BZrFyMXh5DADkaJOXt3sUEkZCWevdsBVSQscb/lCFTRe0aJSwtugiXYBHQltjx/xQiS
        EBFYzyjxa9dMVpAEs8A+Ron2uREgtrCAu8S+S+tZQGwWAVWJu5MmMYLYvAJ2EnO/T2aF2CAv
        sWF+LzOIzSlgL/H3wV+wuBBQzawv36HqBSVOznzCAjFfXqJ562zmCYwCs5CkZiFJLWBkWsUo
        mVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERz0Wlo7GPes+qB3iJGJg/EQowQHs5IIL2Nu
        S5IQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwcnFINTDmzfGe8
        lJL8nVgj08m7sKh98kxO5+OuAddF/j3VENCIX/LImS/kQkjrt0NWFrN2Sy7MMreo387yfMOB
        Y67LbthtmzHn+dtLksfdN5/VaF1z8rtr5852x8Uv9l+I0LfT2cNf8Ofp7lT+7ojiG9ue5yr7
        sZTte565n0vORqFyh8nlTGu36/WXXLm35dz0/D4pRPeucNa+sGybnCUyvw7NiYr2L/s75W2k
        iLUJn6iojsWNJfUaKuozON4bNUYssTgd0/S85bDkuVM8XyVL81ZFpG+5bnrW+QH7Fu45besv
        Zr0pduxUTd324FW52DemywqGsvcYDq947Ou55Et4n8Jm9yKx27tmTc/5y6z1nWt+pBJLcUai
        oRZzUXEiAPvQ7+LpAgAA
X-CMS-MailID: 20220520121722epcas2p359f331c9276eeac5d027b0fe068296f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520121722epcas2p359f331c9276eeac5d027b0fe068296f1
References: <20220520121750.71473-1-chanho61.park@samsung.com>
        <CGME20220520121722epcas2p359f331c9276eeac5d027b0fe068296f1@epcas2p3.samsung.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Adds "samsung,exynosautov9-wdt" to samsung-wdt compatible. This has two
cpu watchdogs like exynos850.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index b08373336b16..8fb6656ba0c2 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -23,6 +23,7 @@ properties:
       - samsung,exynos5420-wdt                # for Exynos5420
       - samsung,exynos7-wdt                   # for Exynos7
       - samsung,exynos850-wdt                 # for Exynos850
+      - samsung,exynosautov9-wdt              # for Exynosautov9
 
   reg:
     maxItems: 1
@@ -67,6 +68,7 @@ allOf:
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
+              - samsung,exynosautov9-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -76,6 +78,7 @@ allOf:
           contains:
             enum:
               - samsung,exynos850-wdt
+              - samsung,exynosautov9-wdt
     then:
       properties:
         clocks:
-- 
2.36.1

