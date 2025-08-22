Return-Path: <linux-watchdog+bounces-4038-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75357B31905
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 15:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17EB97BC08E
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 13:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB212FE56F;
	Fri, 22 Aug 2025 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3vb/9bR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9AD2327A3;
	Fri, 22 Aug 2025 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868546; cv=none; b=jrLQ2XLNkvu292ZavMDVKF2ltPw1BchbVsJD3Fu9mhWmA0/j6vfpxYt/cbbQTGeys03+uVlgH+//Db6kDqd3gTQ94zj1jS1pORySmuDFnZojaydJQbVHRMU0HUGViYZWbhDlmUMSIGaN0w+j0b5a1vrTqtFP+XV+dYoZiJRLKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868546; c=relaxed/simple;
	bh=QM3gjLdrNdwQPyENWkbDDxd/9VE9sssykatbfX7JD+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bUOiYJsSnqcuKgER23mNXRhewiKnFK+RxBzwJq73J84lhJ+CS0Z1RFpcg7p7cb3e7YCnzTPNhhOke5hj2lHpEqV7dDQPCsqkghsbGXXilyv/tSsBf4/hmaH+rX+pHeJl3ad43xLFpORnjKZriAN3aIi2N8IslyH30bnDr4Z/9W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3vb/9bR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8702C4CEED;
	Fri, 22 Aug 2025 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868546;
	bh=QM3gjLdrNdwQPyENWkbDDxd/9VE9sssykatbfX7JD+I=;
	h=From:To:Cc:Subject:Date:From;
	b=Q3vb/9bRAAfrzjQZl6sT867unT/MdR+1UvalIDRdaHZHoo+itisutypbRuzKVvP21
	 5BxuWWfnwZFtsk0ZtvDJ8ot4xBqP0lfO6dIKZYoAD/Tk6rNuzkGKhTWPf1WJ/TwFHl
	 IPXYunMUsxtKnA8fQbxJ4leIu9TvhjFAAUErMPOPKhkOWmtH1LedAlW+/xKPNUd6k0
	 9xIn1ThPiROt9D9w9V/Gkg4Nv2StW8Vq70/bGvm3YNGxgjIIXGaPfXJFhGKKztcsUt
	 kVlXekwq1IXGFJk0Q9pqgkHXszSoT5O1VH+KuXLYNDRIE0bWwzgXPtfqETUkStfjXw
	 ZfbeBIZ4uHX5w==
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
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
Date: Fri, 22 Aug 2025 15:15:24 +0200
Message-Id: <20250822131531.1366437-1-mwalle@kernel.org>
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

[1] https://lore.kernel.org/r/20250822075712.27314-2-krzysztof.kozlowski@linaro.org/

Michael Walle (7):
  dt-bindings: arm: ti: Add bindings for Kontron SMARC-sAM67 module
  dt-bindings: mfd: sl28cpld: add sa67mcu compatible
  dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
  dt-bindings: watchdog: add SMARC-sAM67 support
  dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
  hwmon: sl28cpld: add SMARC-sAM67 support
  arm64: dts: ti: Add support for Kontron SMARC-sAM67

 .../devicetree/bindings/arm/ti/k3.yaml        |    1 +
 .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 +
 .../bindings/mfd/kontron,sl28cpld.yaml        |    7 +-
 .../nvmem/layouts/kontron,sl28-vpd.yaml       |    7 +-
 .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
 arch/arm64/boot/dts/ti/Makefile               |    6 +
 .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1092 +++++++++++++++++
 .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   19 +
 .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   24 +
 drivers/hwmon/sl28cpld-hwmon.c                |   76 +-
 10 files changed, 1234 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso

-- 
2.39.5


