Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C33F352EBC5
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 May 2022 14:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348191AbiETMRb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 May 2022 08:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349082AbiETMR3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 May 2022 08:17:29 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E4515F6E5
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 05:17:28 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220520121726epoutp01ea214196a7482bdd1ecf74a75a5566ab~wz1mQEfl11187711877epoutp01J
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 12:17:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220520121726epoutp01ea214196a7482bdd1ecf74a75a5566ab~wz1mQEfl11187711877epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653049046;
        bh=4kmvPBIkZqHJtMTGkPnH+KRM/kibFIrNWoTADVqb++A=;
        h=From:To:Cc:Subject:Date:References:From;
        b=VL39WPc4PRH1Em/4T6y05H/EXCXWJHYGzbLUPBhYK82GMj6AAuwRhR4GJ+hWWviv+
         iMkgdrcL0EB8koeHaXyqlv9GNvCkkPYZJmpXhbOII5sL7hMKinMWphe5JPSsCctsek
         Em3dgLQlS8OyscXyiDUqFsCIMD3SbGBbpOX9T9KI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220520121726epcas2p1d4c6c289c493f794fb9a2fd15f84310b~wz1lsHjyV2053420534epcas2p1A;
        Fri, 20 May 2022 12:17:26 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.102]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4L4Qhf69xDz4x9Pr; Fri, 20 May
        2022 12:17:22 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        13.6B.10028.2D687826; Fri, 20 May 2022 21:17:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220520121722epcas2p371cb5e1300674a2aee017f857b60226c~wz1iDYpZI2568025680epcas2p3M;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220520121722epsmtrp298e354782581bd19db2c06eb32135d0d~wz1iCnDef1007110071epsmtrp2W;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-69-628786d22d1e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        1C.2A.08924.2D687826; Fri, 20 May 2022 21:17:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220520121722epsmtip29bec42c29638fdbad386407fa2209f3d~wz1h28gb60067800678epsmtip2W;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 0/4] support watchdog for exynosautov9
Date:   Fri, 20 May 2022 21:17:46 +0900
Message-Id: <20220520121750.71473-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjk+LIzCtJLcpLzFFi42LZdljTTPdSW3uSwe81ahaX92tbzD9yjtVi
        7+ut7BYzzu9jsrixbh+7xZOFZ5gsWvceYbd43gcUe/zyH7MDp8emVZ1sHneu7WHzWLlmDavH
        zu8N7B59W1YxenzeJBfAFpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeY
        m2qr5OIToOuWmQN0lJJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLxArzgxt7g0
        L10vL7XEytDAwMgUqDAhO+Pek/ksBQfZKp5tqGpgnMfaxcjJISFgIrG06QNjFyMXh5DADkaJ
        s4vWsEA4nxglriy/ww7hfGaUOLBgOVALB1jLhw+VEPFdjBK/rzZBtX9klFh5cTYzyFw2AV2J
        Lc9fgSVEBNYySjx/PpEVxGEGadl8/w/YdmEBM4kVF1YxgdgsAqoSu149YwGxeQXsJPa8fcgC
        caG8xIb5vcwQcUGJkzOfgMWZgeLNW0G2cQHVPGKX2Dn5AtRLLhJnvnaxQ9jCEq+Ob4GypSQ+
        v9vLBmEXSyyd9YkJormBUeLytl9QCWOJWc/aGUEeZRbQlFi/Sx/iZ2WJI7eg9vJJdBz+yw4R
        5pXoaBOCaFSXOLB9OtTJshLdcz5DXeMhcfHIMbDhQgKxEkumfGedwCg/C8k3s5B8Mwth7wJG
        5lWMYqkFxbnpqcVGBcbwWE3Oz93ECE6YWu47GGe8/aB3iJGJg/EQowQHs5IIL2NuS5IQb0pi
        ZVVqUX58UWlOavEhRlNg+E5klhJNzgem7LySeEMTSwMTMzNDcyNTA3MlcV6vlA2JQgLpiSWp
        2ampBalFMH1MHJxSDUxcj7Prj6/gNlppviZRcra+qu22kq/G+4pb1Xr8QrftPpmW/PxMwXUf
        npUC6R+CD7Zq2EWleZ/p0/+8afaFOW+djn870f0mZ/tG9weLOW1ZWqueNzM7lm+O7kpYvpwz
        +PZJyabVHew23H67F3nezRJ/q201o/qWc91nztJ1ls9LxQ4qMQnfiXhxfV1bsHrOsSS+rbtP
        vZCULdfTl3iS2r9pIv/CHvN5t50VivKefZqWvkBfbcshXfkd66K153w1+nd+R9KHvtnM58tn
        3/Lf/4Dh7pof+746HeT0uZIgaKgsX5rjt8r041pO/gKFC7UJfWrTlx2UL72efqP/UMxpNhVf
        67BjxyZIKZzUa6iX91BiKc5INNRiLipOBAAb7Gp8IQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsWy7bCSvO6ltvYkg+XN/BaX92tbzD9yjtVi
        7+ut7BYzzu9jsrixbh+7xZOFZ5gsWvceYbd43gcUe/zyH7MDp8emVZ1sHneu7WHzWLlmDavH
        zu8N7B59W1YxenzeJBfAFsVlk5Kak1mWWqRvl8CVce/JfJaCg2wVzzZUNTDOY+1i5OCQEDCR
        +PChsouRi0NIYAejxKUPs1m6GDmB4rISz97tYIewhSXutxxhBbGFBN4zShy9GAZiswnoSmx5
        /ooRpFlEYD2jxK9dM8GKmAX2MUq0z40AsYUFzCRWXFjFBGKzCKhK7Hr1DGwBr4CdxJ63D6GW
        yUtsmN/LDBEXlDg58wkLxBx5ieats5knMPLNQpKahSS1gJFpFaNkakFxbnpusWGBUV5quV5x
        Ym5xaV66XnJ+7iZGcPhqae1g3LPqg94hRiYOxkOMEhzMSiK8jLktSUK8KYmVValF+fFFpTmp
        xYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwTVpl1+k468evRrHPF4LMc65Mupy3
        KHOJ3a1DfsVSTTr5Pa4lekx3XpzIC847WBbouNo6UuFmecq3Bvbdbo3lT8sPnXtw4cl3N7Yp
        sWzni9LOqx+ZmXLm7uOlqaH7ta7UCZXoulz7uFAnqkGBa9HKbZ7Ma5oPp275VS2a2Mqxel1n
        vGFY5/lP33MM9E3ndylU9wqGX5F2rLq8U6vm5IsVZ5YmlokJ/+U1Xy7J91XyzeqTRw18Enfd
        1Y6b7zehhKXg8ELjHxpefyTmNR7OubV0Z1rosZZdto0FDXsklt23M9ve4Nl150io2Ptr05MT
        JeTc6j9Ov+cU1X/9kK7nSRlDlb1iDv6nTcsPxy02zkpVYinOSDTUYi4qTgQAZLfq9s4CAAA=
X-CMS-MailID: 20220520121722epcas2p371cb5e1300674a2aee017f857b60226c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520121722epcas2p371cb5e1300674a2aee017f857b60226c
References: <CGME20220520121722epcas2p371cb5e1300674a2aee017f857b60226c@epcas2p3.samsung.com>
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

This adds to support watchdog and its device tree nodes for Exynos Auto
v9 SoC. Like exynos850, the SoC has two cpu watchdog devices but they
have different CPU configurations compared with exynos850. So, we need
to add separate configurations for Exynos Auto v9 SoC.

Chanho Park (4):
  dt-bindings: watchdog: add exynosautov9 compatible
  watchdog: s3c2410_wdt: support exynosautov9 watchdog
  arm64: dts: exynosautov9: add watchdog DT nodes
  arm64: dts: exynosautov9-sadk: enable watchdog devices

 .../bindings/watchdog/samsung-wdt.yaml        |  3 ++
 .../boot/dts/exynos/exynosautov9-sadk.dts     |  8 ++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 22 ++++++++++
 drivers/watchdog/s3c2410_wdt.c                | 41 +++++++++++++++++--
 4 files changed, 70 insertions(+), 4 deletions(-)

-- 
2.36.1

