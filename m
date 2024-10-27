Return-Path: <linux-watchdog+bounces-2336-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A24889B1D47
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 11:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DF891F21466
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 10:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF5C13F43A;
	Sun, 27 Oct 2024 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="qsjma/KT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB8025765;
	Sun, 27 Oct 2024 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730026438; cv=none; b=pbRUHctXfDWXCeTQBeKlmpeTFuTILrTXU9Zd7rzGzlPWu1xtRm6ZrLflxlXZzzOhPo+MZHkUjc6c1EPoJoXoVeHLeLO1FbfbR0zd2QhQABsZlc42zBz5ds76f/P9QYUZloDdUc8QCcjNG3viGvD/9ACC4/heyaOG4B+AS9IazD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730026438; c=relaxed/simple;
	bh=nk1l1m5oYbsHkoiFbznWTwgA2g7/a3hrTBh19gifZ6E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D4N1b2H/koEPHO34R4IjoxyWWpwAef/ZHNDxy8ThOtFh+Ri+mTkCD3u23ONuYFb3wu5Vo2Sm9OMsY5Zqqh4CrKKpTkhzJXH1y16FedKLt70clqzSFESOakovKD/8YuW5A2+mb0fU+meOOkvDtAmsBlkyPFZMjKk7fLWLivcZaH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=qsjma/KT; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730026407; x=1730631207; i=wahrenst@gmx.net;
	bh=8iAjfp3IZqNtfjG5p6rBm4nIaaA6IIY8fzarf/jnTV4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qsjma/KTfsBWZ7Ay0WZgqTunCSgisy+6kN9qVfz+DzCiDhtoZaiwYXR0PBuSQLZI
	 LTcGNadO1hsqJrvYnDVEEvnTUNrzICYJgEZgIxy5/bmuCiZr1OI6xldizRh8neAQe
	 6/y9NNqZA/eNco07S9qn6afmTLQJMqYVOWV9J3iQydK/SF9MMuPLVdst8Q5ZNw5V3
	 8ZMbKtiYf+2X08s0tUtMA8abk1ytBrGeKmXJw/mF4RNSzcffyqJCD1w+Y212CQ3/T
	 uLiOTHZPADaiJxGTpNtYtc17ncppc5oLscNriP3aIpM8tZeOSObmDMwsr0cqil+Qx
	 Zs32fuUPKrc0A9aWsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mBa-1u1XtS3BFs-016h5e; Sun, 27
 Oct 2024 11:53:26 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Alice Guo <alice.guo@nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/2] watchdog: imx7ulp_wdt: Improve readability
Date: Sun, 27 Oct 2024 11:53:21 +0100
Message-Id: <20241027105323.93699-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dPMOiJ9GJbaXK0x2k4K4y1HnNpBHzzvVLoB1lJKuePVd/q9fADX
 TyKyqzplLk7c0AKBNDqqWC+M23hqCBv7KwT9+45WH+mghrTP9GBuUrKEusG8Y0KoxtgAmCf
 e+eY8a47yfZ8cW2ChV8n/kWCdwrHRhHXc9F1JZ6xZEcFp8yKxDcpGYY/52y7EQJqMvZaphm
 chQpfT08ZBHK6Zbv0bOJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UEX/VUDuIUs=;bxPMBdSJ3TZO+ouRniI5660LoTs
 GqRd24na/MuaoH4sCc/dM1+K5nymLZtjK+7lRtb2JQydUdb+c3CSWxMjiA0BW6UB14Wel0giM
 ibobIedPDP2m/YVKF4qGXwTLB/rKypn4YWUsYeuhuJvE7qD/gxLBHosFw2UphfuETMlXmrqwp
 yFpIAYqD6ajVA3tF6BivzjRLpnqpCtYbqiIQospQmOvmAIVqDfEfqcIi6yFUpSphkOoq3PxOk
 9fJ5eRddGyjWZnBljSz+RXc7Q8qtWnhvvvpFoqxh9QS0GDAUL4JAzcnRqJgOD9KT9DYDiS/Q0
 nAdgoLj9tot/YA5SfnWA3IyLwWeoucZAu2sbo9w5GdfAbp+ZoEOz+cwZ6/kcGJ3RdFs0EqaEH
 njuZzy0SCU/pEq/iAKjKKJwwJZ1XADBItrOBrtQU45AT4VIEtBAVAxlfkya4i8wwrnxPbg3XK
 0xNRWalhhe4AGxIHGUOiXs23z1OQEiksAJbfAroekor1c9xH+U8qfBLstJRrSdPI9XBJ24x7J
 3qgCK8LMVgOEdZDiThD5Mb2UHmF1nYneuU3B58jl9f/wG/XRUn2LWgzMHYsxoshrhwY3w4GpW
 773LCndWzqCR+h3X5mnixVd00y36LMAL7iY8M1D07u7S3RWWKnUCSvRS6mykXxjP0WEHouDTX
 93vOa53mmT1pWCzuOYiZX9IMlrmOVOifnZPQN60Ue3OirrPeXKVzHTj+lCJC3h+FiDCHYDboz
 YN4fc9kpydtiCTr7FzS/YDPVXo5gI3gm67ZEaQkRvza1c6nrZ79yMlbTJ94wezLNWBQhn5S0O
 9dt2jq7r9Iu//TV6/VrS2pTQ==

This small series tries to improve the readability of imx7ulp_wdt.
For someone who didn't read the reference manual, some parts of
the watchdog driver are not clear.

Stefan Wahren (2):
  watchdog: imx7ulp_wdt: Clarify timing units
  watchdog: imx7ulp_wdt: Add TOVAL range check

 drivers/watchdog/imx7ulp_wdt.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

=2D-
2.34.1


