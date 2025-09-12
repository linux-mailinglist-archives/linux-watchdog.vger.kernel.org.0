Return-Path: <linux-watchdog+bounces-4236-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 689CEB54D1F
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 14:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 989FF3A373A
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 12:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5982C3093A8;
	Fri, 12 Sep 2025 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iv9ihUa9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5A63090FB;
	Fri, 12 Sep 2025 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678887; cv=none; b=Dk+1C1CXT7mU3C1KgHie+XuUIHrh4UH1GgIXevhZ9uINE1MFGDswpjt0hLXdz0WI+6NFVe/4qTTYvi65YuYGsp7E7kurdqNnDqZPLSJUKZ5xqYG5fnpiC4y/709rw9/jxZy+UWqBjrscgvGk2oY9obMGbQRGdYjhEkt/qKnOqgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678887; c=relaxed/simple;
	bh=wJwOnYjjBM2ff4ferRQlzqp+j9TiO4Bd0Gj/yWI3ikg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U0rEuCKwhWVxdQOkfeao0eopWS8cwv9JP4/GURQXMbQ2pdUPRsE7kI7nBBrYR0J5Ol54h4KFE/3N6cXDnbXL51A9ATpPYcnvlY4MIT5gcdogLmg6oJZDAwO/mJnu3G6K1tt8Dd8CkYW0+E99oG+Jn/yVWKsgBo2oHto2zBqNnLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iv9ihUa9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C92C4CEF1;
	Fri, 12 Sep 2025 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678886;
	bh=wJwOnYjjBM2ff4ferRQlzqp+j9TiO4Bd0Gj/yWI3ikg=;
	h=From:To:Cc:Subject:Date:From;
	b=Iv9ihUa9xREJ4gWjwJcF5xr1lwQt/bJPmEEaxFZsTJaec8mXvhsuFxHar1Pvdn0L1
	 62/2z+PMzdTRxSbqob75l56WjpDK07la2JA0t18sfigTv0c86yeptCnvhcG7iany0c
	 +b9LP/B1kJiu8wCk9UFqzg1NQoL8NQz4wJEkQvnT1wDvnNziwh7XwJED/pil8dvqMc
	 4GkLSxCbqOAhIQODcE+8q+k95jO/8D25n5sge4tSDI19mz2D3w+3XYnrTsee82mP5y
	 tdkr2Tsm7Aio5UeU84EUkmL4Fu+43KOB9Z3+554Eua04Foh0JnuXDh253qrVtmlhcU
	 8taeb58Gbix0A==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Andrew Davis <afd@ti.com>
Subject: [PATCH v2 0/7] Initial Kontron SMARC-sAM67 support
Date: Fri, 12 Sep 2025 14:07:38 +0200
Message-Id: <20250912120745.2295115-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the PMIC support is there, we can finally, upstream the
support for this board. Besides the usual device tree, this
patchset contains the support for the on-board house keeping MCU. It
make extensive reuse of the drivers for the former SMARC-sAL28
board. Besides different hwmon sensors, all the dt binding patches
will just add a board specific compatible (in addition to the old
sl28 compatible) to make any future board specific quirks possible.

I'm aware that there is a patch [1] which moves the sl28cpld MFD
schema to a different directory. Once that patch is merged, I'll
repost this series. But I already want to get some early feedback.

v2:
 - dropped patches which were already picked up
 - new patch "dt-bindings: mfd: tps6594: allow gpio-line-names"
 - separate driver for the hwmon, add missing hwmon documentation,
   thanks Guenter
 - split the DT as suggested by the SoC maintainers
 - add missing copyright and license to the overlays, thanks Andrew

Michael Walle (7):
  dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
  dt-bindings: mfd: tps6594: allow gpio-line-names
  arm64: dts: ti: Add support for Kontron SMARC-sAM67
  dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
  dt-bindings: watchdog: add SMARC-sAM67 support
  hwmon: add SMARC-sAM67 support
  arm64: dts: ti: sa67: add on-board management controller node

 .../devicetree/bindings/arm/ti/k3.yaml        |    1 +
 .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 +
 .../devicetree/bindings/mfd/ti,tps6594.yaml   |    1 +
 .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
 Documentation/hwmon/sa67.rst                  |   41 +
 MAINTAINERS                                   |    1 +
 arch/arm64/boot/dts/ti/Makefile               |    6 +
 .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 +++++++++++++++++
 .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 +
 .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   31 +
 drivers/hwmon/Kconfig                         |   10 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/sa67mcu-hwmon.c                 |  161 +++
 13 files changed, 1377 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/sa67.rst
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
 create mode 100644 drivers/hwmon/sa67mcu-hwmon.c

-- 
2.39.5


