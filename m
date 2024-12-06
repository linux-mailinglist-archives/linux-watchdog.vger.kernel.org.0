Return-Path: <linux-watchdog+bounces-2506-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 711199E6478
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Dec 2024 03:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5688116A03F
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Dec 2024 02:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F2E18C03E;
	Fri,  6 Dec 2024 02:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MBXuISMu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8681E522
	for <linux-watchdog@vger.kernel.org>; Fri,  6 Dec 2024 02:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733453523; cv=none; b=lsqodYoHhzZ5YmU5D2GxCdQkcCsOXu4kStShrLygAytIxgEWL9QCq41zFLIpX4RDkDMvhoTVP2TMKUwmz0Kua0H8c4KGHjDz9AQr6CHi1HFSILWGL1eyugcq7KRUmpTEF119hSr1IFXXEWC0XFZti6zAE5H2AsuLbpZvPGhkXYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733453523; c=relaxed/simple;
	bh=D3IcC7CgJj6OaAEMHhHgaH/hOvMNa7aAkLgb8hPpS3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=u3sBagAt8yY1LUnjJXKN7f5zV2LtVzGkV1tZac/PhP3GjQpzxIFYCYj+qdCu8mgFpstRdK1qELPn+Dn61QG5RMuPRE+ZeyOUkBAcypWjH5FtgesAKYB+JyFXolbpNoPcXRQoA/Qgkx2smq4i42SkKmgDz8puZLtIBZh5x3lNJEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MBXuISMu; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241206025157epoutp03ccd335b66c3e3ba1116b7db905d283db~OdspOFAap1106111061epoutp03Y
	for <linux-watchdog@vger.kernel.org>; Fri,  6 Dec 2024 02:51:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241206025157epoutp03ccd335b66c3e3ba1116b7db905d283db~OdspOFAap1106111061epoutp03Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733453517;
	bh=6LT5uy4r9SoucdiBUQ2ux48TSKGEPUDPIQrFKGuIK9Q=;
	h=From:To:Cc:Subject:Date:References:From;
	b=MBXuISMurPFrV85B7Lf2ZzBhVrc9tg0gFUbkxnhjsqd8E21TMc7s3ISEWQA8BGFSd
	 +V1EbQe/6m7xMbOFEw84QXCPn0LTgvfyN/tPvoivgdEHXDN+OeNJ0tJ0GvZxQO86Yt
	 9FD8hxXDjzxJ6EXzGIhQNagCUuOjnYnGpCiMjXGM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241206025157epcas2p1dc6f3dccba7529252f1dac17455db56d~Odsoc8OkE1560915609epcas2p1j;
	Fri,  6 Dec 2024 02:51:57 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.98]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Y4G4X4mqzz4x9Q2; Fri,  6 Dec
	2024 02:51:56 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	8D.63.23368.CC662576; Fri,  6 Dec 2024 11:51:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241206025156epcas2p3e1ce9ff35589d821735a7c038b9ac9da~OdsngzogD0570805708epcas2p3W;
	Fri,  6 Dec 2024 02:51:56 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241206025155epsmtrp1674734df029fff980875d050de3710da~OdsnfDxrZ0384203842epsmtrp13;
	Fri,  6 Dec 2024 02:51:55 +0000 (GMT)
X-AuditID: b6c32a45-db1ed70000005b48-8c-675266ccc57e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2B.74.18949.BC662576; Fri,  6 Dec 2024 11:51:55 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241206025155epsmtip17fe879512350ced0886742423827a6df~OdsnUlI6s3233732337epsmtip1Q;
	Fri,  6 Dec 2024 02:51:55 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH v4 0/1] support watchdog for exynosautov920 
Date: Fri,  6 Dec 2024 11:51:37 +0900
Message-ID: <20241206025139.2148833-1-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmqe6ZtKB0g50XFCwezNvGZrFm7zkm
	i/lHzrFavJx1j81i0+NrrBaXd81hs5hxfh+TxY11+9gtniw8w2Txf88OdotJi88zWTx++Y/Z
	gcdj06pONo+Va9awemxeUu+x83sDu0ffllWMHp83yQWwRWXbZKQmpqQWKaTmJeenZOal2yp5
	B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gDdqKRQlphTChQKSCwuVtK3synKLy1JVcjI
	Ly6xVUotSMkpMC/QK07MLS7NS9fLSy2xMjQwMDIFKkzIzvi8YzF7wWruinVNSg2Mezi7GDk4
	JARMJD69Fe9i5OIQEtjBKLFx5WUmCOcTo8Sr82dZuxg5gZxvjBInbyWD2CAN536sYIMo2sso
	cXrlK3YI5yOjxLqJ35hAqtgEtCS2HX4FNkpE4DWjRFPvO2YQh1ngPKPEoUNNLCBVwgI2EmuW
	/2QEOYRFQFXi8L1sEJNXwE6ia180xDZ5iUlrWplBbF4BQYmTM5+AdTIDxZu3zgYbKSHwl13i
	8dcJzBANLhKLeppZIWxhiVfHt7BD2FISL/vboOx8iZUrTzBB2DUS99p2sUDY9hKLzvxkB7mB
	WUBTYv0ufUgQKUscuQW1lk+i4/Bfdogwr0RHmxCEqSoxfVkAxAxpiYkz1rJB2B4ST19uYoEE
	YazEjJfPmSYwys9C8sssJL/MQli7gJF5FaNYakFxbnpqsVGBITxCk/NzNzGCk6iW6w7GyW8/
	6B1iZOJgPMQowcGsJMJbGRaYLsSbklhZlVqUH19UmpNafIjRFBi2E5mlRJPzgWk8ryTe0MTS
	wMTMzNDcyNTAXEmc917r3BQhgfTEktTs1NSC1CKYPiYOTqkGJl7GX04G0fO3x5uKJCy91XJ9
	T96l4mvp4S7yoSyy/988ZPsiHLJ94Y0F8bzTjnnv4+9jOK8sXtzUtGlGYL1i65nEtzU1x2Rn
	tX5/r+jeIZhU2WypwF+hMJFzym7G1K4ZdQ+zOg7Y9XX13y377MPr0RMl8NbsrbpD5vZbbREm
	0n+kv4YxeWZsCVIoCF/pJ7tBdKvrUqmWvKgdpw+f6ba8IbPziarBdjlG9w29SYWRvQ9fFPQ+
	WPA99m9k5WOn3Kymu2eTl/gnZSW9dwz7aKFxLaAg5dXnbVcWlhhk7Nzd8DNho/GVJ7Nr/+6d
	0/38tXPHHeU7xTO/KWe/+tDbFX0pbI/CoSfzJ96vSJtd961FiaU4I9FQi7moOBEAsFGoeisE
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWy7bCSnO7ptKB0g76dFhYP5m1js1iz9xyT
	xfwj51gtXs66x2ax6fE1VovLu+awWcw4v4/J4sa6fewWTxaeYbL4v2cHu8WkxeeZLB6//Mfs
	wOOxaVUnm8fKNWtYPTYvqffY+b2B3aNvyypGj8+b5ALYorhsUlJzMstSi/TtErgyPu9YzF6w
	mrtiXZNSA+Mezi5GTg4JAROJcz9WsHUxcnEICexmlJjy4iwTREJa4sjvF2wQtrDE/ZYjrBBF
	7xklHs68xAySYBPQkth2+BUTSEIEJHH2yy9GEIdZ4CqjxI9F79hBqoQFbCTWLP8JlODgYBFQ
	lTh8LxvE5BWwk+jaFw2xQF5i0ppWsJm8AoISJ2c+YQGxmYHizVtnM09g5JuFJDULSWoBI9Mq
	RsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzg8NbS2sG4Z9UHvUOMTByMhxglOJiVRHgr
	wwLThXhTEiurUovy44tKc1KLDzFKc7AoifN+e92bIiSQnliSmp2aWpBaBJNl4uCUamASv826
	SnXt3rjzG741/pGL3WnxP3zJvjn3XeexWD27HPHgGtvUhy4xnatPXW2xXf6/7+ndzriWjc9/
	6Yq+rS2Nv/B60d3DbUavpZlXpdl+4zjaJSYc2r505YPS7eXLrm/zuThttYggn4XggudRgtEq
	TOtXTet6s7iGmXk+79xjFR7rlkXKzrxz5LpbSZmdYLdDcqbS7F3plevNWC3bvCazH974vCXr
	LldG08+9sX/y5ievcy1XtFFZ53bL52fDnSiL5hcGzjo73qSm6j3M+mRYwGxrEVrVl8Z++PY3
	V6sTGs4CS5wcgj++NPu/0fh7wjGGKYseTX8ooj33tkTSqmNaLv/zi3XFD0t5lpx7bFCqxFKc
	kWioxVxUnAgAIb630N4CAAA=
X-CMS-MailID: 20241206025156epcas2p3e1ce9ff35589d821735a7c038b9ac9da
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241206025156epcas2p3e1ce9ff35589d821735a7c038b9ac9da
References: <CGME20241206025156epcas2p3e1ce9ff35589d821735a7c038b9ac9da@epcas2p3.samsung.com>

Add support for the ExynosAutoV920 SoC. Basically this is almost
similar to ExynosAuto V9 or Exynos850 such as two watchdog instance for
each cluster but some CPU configuration are quite different.
Therefore device tree, compatibles and drvdata should be added.

In v3, the first and second patches were approved by watchdog maintainer and added as next-git.
- Link: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?qt=grep&q=bt.cho

For the last third dts patch review, the patch was rebased and made v4.

---
Changes in v4:
- The first two patches were approved in v3.(1/3, 2/3)
- v4 contains only one patch that needs to be reviewed. (3/3)
- Rebase to the lastest master branch
- Link to v3: https://lore.kernel.org/all/20241021063903.793166-1-trunixs.kim@samsung.com/
---
Changes in v3:
- Add Acked-by/Reviewed-by tags 
- Link to v2: https://lore.kernel.org/all/20241010111807.3635504-1-trunixs.kim@samsung.com/
---
Changes in v2:
- Add a space before }
- Fix worng variant condition (cl1 -> cl0)
- Move the location declaring watchdog node
  to the correct location that fits the DTS coding rules
- Link to v1: https://lore.kernel.org/all/20240913080325.3676181-1-trunixs.kim@samsung.com/
---

Byoungtae Cho (1):
  arm64: dts: exynosautov920: add watchdog DT node

 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
2.47.1


