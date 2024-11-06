Return-Path: <linux-watchdog+bounces-2418-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E82BB9BE4AC
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 11:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DE79B23187
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 10:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EC31DE3B3;
	Wed,  6 Nov 2024 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="f03K9Ojm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544151DE3DF
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Nov 2024 10:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890074; cv=none; b=ebXPHVAnqB6+T/4CBohZ3/IPDT+paQnQ+UuzULCIar/3ue6frGtP/afLJAGFUyxy0fGhB+HuBUeBrPdbS5FOAo54p2KOU7jRcWElttWPLVo766I6f54Sh6XbI2jpoFABjfwpFx2JVRx7HOT8AiQwTIZlFJhFwK7IQnE1pezdPJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890074; c=relaxed/simple;
	bh=v0ldc4MKuJZxd0Vs4Lc8g4q7qJQo/4A845isTxqoHzQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VD/4RlmDzSoEIS3irEh3aNbdbHPaC6A7vu1HKrjcxDxT5VOds6uOObYJLO4uv3tne8BbD6Tdy4f1PgtLWgxWLgR9Cxx/pq33XY+v1WgkEANXy/ZH/jEUGOSyURcYz1uNiYcDQOKS0Y/tq/fDj9/RWSKcEUCwrZ+mXDKI9ZgSlrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=f03K9Ojm; arc=none smtp.client-ip=185.70.40.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730890070; x=1731149270;
	bh=okwVwo7asZ9u+tVOHleOHRoJjZ574ZQY9yfS63ntQdM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=f03K9Ojm1YKTa2f7VqL7KWrRdp47xlYl0cBwVOYq6zyWRWu3LU3bZlKRsdIX4ROLa
	 noPNHsmSxxgp3PQrt7SbxWSPx3Zpavi/X+ubull6a1XpFSS2c6KMd1E2JOShfklsQo
	 uB1zNKPvFSNvNOo6TZvY6zePQdKaUqJBmNCoNPQmbTDqSOllCOu7AOPlT9r7xik+1T
	 4vn94zWTP3xFu9MQaebWHAu01QJjlGYHnYenPohpc1bilsrDrLZCPiUgIiQuHFa3Pw
	 dtHXbOgCFJAPv7cyUZj1YF/CUQBo93DVI1hi1vxgNG57oHz8UjKw1hQGAMDxtfPyTg
	 EQLfSZfN2JecQ==
Date: Wed, 06 Nov 2024 10:47:46 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] MediaTek MT6735 TOPRGU/WDT support
Message-ID: <20241106104738.195968-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 09934d38fc3ebae1fee80fc7dd599a9c054ee796
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

These patches are part of a larger effort to support the MT6735 SoC family
in mainline Linux. More patches (unsent or sent and pending review or
revision) can be found here[1].

This series adds support for the top reset generation unit (TOPRGU) found
on the MediaTek MT6735 SoC. TOPRGU generates several reset signals and
provides watchdog timer functionality.

While doing so, a fix is made to the restart handler to make it work even
when the watchdog is disabled by default (never enabled by the bootloader).

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Changes since v1:
- Split restart handler fix and MT6735 support into separate patches.

Yassine Oudjana (2):
  watchdog: mediatek: Fix mtk_wdt_restart
  watchdog: mediatek: Add support for MT6735 TOPRGU/WDT

 drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

--=20
2.47.0



