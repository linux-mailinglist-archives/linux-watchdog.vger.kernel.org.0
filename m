Return-Path: <linux-watchdog+bounces-4961-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFKPD1cmnGlfAAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4961-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:05:11 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D907F17472B
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64F7230071F0
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 10:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DFC34FF78;
	Mon, 23 Feb 2026 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoFHwNP4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E03734D39C;
	Mon, 23 Feb 2026 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841106; cv=none; b=R/GZPDwIz6QC2T7RBs5waJ3Kb181djoYG+sq3DsJ8Smn1GRHdrCb/5VEbmaRnDvd9RagxocJQfjYc9WzrUW53LTkBHN09l4WBenk5SJ+NJjnjCV4sz7FtgdxTrCRvKzBrZkHpZ81XIiZHOS0nCTbJrnCbvCkdPa460sgNUYYtoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841106; c=relaxed/simple;
	bh=wStn2+PjC1n8XDfeiGKbYBLcOVjDTf5kAPZijXt74vE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGwPAWpKpkrU/CIDFE69f5F+rYCstVwZ6HJf0B1lhXeHGbFOEVj35bSee9MJeh6zZJkvVMbQIroD2EA4TFpRK1KgbOidv0pZeQrBdTvF0pasqwKfFuDZm+Dne6f2KULb68BvD1K/Jp3q1Rljc0YoAmJoXuworQjxBwb3NBsfb64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoFHwNP4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B134CC116C6;
	Mon, 23 Feb 2026 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841106;
	bh=wStn2+PjC1n8XDfeiGKbYBLcOVjDTf5kAPZijXt74vE=;
	h=From:To:Cc:Subject:Date:From;
	b=HoFHwNP48AK/BC6Qxp/PeY0A6vdNQP7x1fl42q1yHlar2qwBXgz+NJ0fo2mHIPA+E
	 +Xh6zfXdq0zbF9gnl7Voejy0WInONBPYkZKCRA4T2sSeJfJBuQdMB7oQjMkQI9yXQW
	 hTjDRwuLm58wMbZpQC8uwp4zByUh/9idY9/nyf1QNuRx7wPsgnuVsbB05YC44Qdccb
	 Id6QDrYf4R+vzHenoI5UnQcxzUTNT89QzOPMvZ2O5fxlIJ0a1gFFfAp1MzmpEG5CM/
	 wL0iYQuZhVPYrqFx9CGnDM6ARZtI05yrJckZEbuHKNQ9mKnbivVeVWjOdDkDiweyWT
	 DTCrzZJBQO+gA==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 0/8] Remove the Kontron SMARC-sAM67 board
Date: Mon, 23 Feb 2026 11:04:45 +0100
Message-ID: <20260223100459.844967-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-4961-lists,linux-watchdog=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D907F17472B
X-Rspamd-Action: no action

I was informed two weeks ago that this product is discontinued
(without being ever released to the market). Unfortunately, this
collided with the merge window and I had to wait two more weeks.

Pull the plug and let's not waste any more maintainers time.

Please let me know if this can be picked up in one go or if the
device tree has to be removed first and then the drivers together
with the dt-bindings.

On the bright side, the board upstreaming brought some driver fixes,
too. I'm really sorry for any wasted time.

Michael Walle (8):
  arm64: dts: ti: remove the Kontron SMARC-sAM67
  arm64: defconfig: remove SENSORS_SA67MCU
  Revert "hwmon: add SMARC-sAM67 support"
  Revert "dt-bindings: mfd: sl28cpld: Add sa67mcu compatible"
  Revert "dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module"
  Revert "dt-bindings: nvmem: sl28cpld: add sa67mcu compatible"
  Revert "dt-bindings: watchdog: Add SMARC-sAM67 support"
  Revert "dt-bindings: hwmon: sl28cpld: add sa67mcu compatible"

 .../devicetree/bindings/arm/ti/k3.yaml        |    1 -
 .../embedded-controller/kontron,sl28cpld.yaml |    7 +-
 .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 -
 .../nvmem/layouts/kontron,sl28-vpd.yaml       |    7 +-
 .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
 Documentation/hwmon/index.rst                 |    1 -
 Documentation/hwmon/sa67.rst                  |   41 -
 MAINTAINERS                                   |    1 -
 arch/arm64/boot/dts/ti/Makefile               |   13 -
 .../dts/ti/k3-am67a-kontron-sa67-ads2.dtso    |  146 ---
 .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 -----------------
 .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 -
 .../dts/ti/k3-am67a-kontron-sa67-gpios.dtso   |   61 -
 .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   31 -
 arch/arm64/configs/defconfig                  |    1 -
 drivers/hwmon/Kconfig                         |   10 -
 drivers/hwmon/Makefile                        |    1 -
 drivers/hwmon/sa67mcu-hwmon.c                 |  161 ---
 18 files changed, 3 insertions(+), 1604 deletions(-)
 delete mode 100644 Documentation/hwmon/sa67.rst
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
 delete mode 100644 drivers/hwmon/sa67mcu-hwmon.c

-- 
2.47.3


