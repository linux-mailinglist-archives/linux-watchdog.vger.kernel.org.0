Return-Path: <linux-watchdog+bounces-5030-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE60B1WEpWkeDAYAu9opvQ
	(envelope-from <linux-watchdog+bounces-5030-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 13:36:37 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079D1D8B0B
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 13:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD051304FA6E
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 12:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AF03ACA6A;
	Mon,  2 Mar 2026 12:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhSANKRD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273593A784B;
	Mon,  2 Mar 2026 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454358; cv=none; b=kWlqOOFH2YeidzXEs2obvsc25SkDVeuiVUUc2z0ZPejzhGfopo9YfB5PWc+qBE9llCWVMZP/Qm0pt6uzCBr9qjBRNuI0LQmMAQLluEy+mvxLUeuZvgnVWaKKAfLY+kOoCNnie/oHRgoJevxLecDQTCmGQmyTXyttKUz6QOW2PeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454358; c=relaxed/simple;
	bh=EJr2Mq3lKojirQvqkCZGmLtZh7IobNepi+pjmnv8tD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IqRDVm6HHRl6JvbyGKs2T1xLOHwE8792hJOPzuvLzO+iP9L+4olphVXjaA8GXQ/9aIxnjnQJQ44JlIcaWOkUI+5siYKr2w6mWYUtPVVrm4TnFZJe6SyKFVTJhz02D8PMEo2HlRDmTR/TQGXJfMLvc6V69dtdTANRUPjqd9JXUs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhSANKRD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8546C2BCB1;
	Mon,  2 Mar 2026 12:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454357;
	bh=EJr2Mq3lKojirQvqkCZGmLtZh7IobNepi+pjmnv8tD8=;
	h=From:To:Cc:Subject:Date:From;
	b=GhSANKRDBvuspzgx+8jGlOgR4kTQBYjLlQmESWiyEqr7otJV9+z55JUwcB4kAJJul
	 gUcXYad8pHjh4kd34QkTpNQAkpHHngA1LiQKnklMtIS1yyw9q0/ZWft3HJjnX1yT6k
	 wqjlL4r88EJIxlTd5ycfpppZ9ju5mc5QVPehi6S7rRKt+v2S5dGhy5m0Qf9uCEWh/Y
	 dHYxQJnHmGOhnxv1mHwbxg93YfeyB5x/a9fJkvUUwG451sWeW0QQXIiyiU21xDg6Wl
	 q38sanNbqro8/GcxD3XkO0eguZInS/5Tarujo8Sg+4KiKqV6G7SlP6POieY77d4BUL
	 UO1iFt0SvGKxw==
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
Subject: [PATCH v2 0/7] Remove the Kontron SMARC-sAM67 board
Date: Mon,  2 Mar 2026 13:24:45 +0100
Message-ID: <20260302122540.1377444-1-mwalle@kernel.org>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-5030-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9079D1D8B0B
X-Rspamd-Action: no action

I was informed two weeks ago that this product is discontinued
(without being ever released to the market). Unfortunately, this
collided with the merge window and I had to wait two more weeks.

Pull the plug and let's not waste any more maintainers time.

On the bright side, the board upstreaming brought some driver fixes,
too. I'm really sorry for any wasted time.

v2:
 - drop hwmon patch, that was already picked up by Guenter Roeck
 - reword commit message and don't use the default "git revert"
   template as suggested by Krzysztof Kozlowski.

Michael Walle (7):
  arm64: dts: ti: remove the Kontron SMARC-sAM67
  arm64: defconfig: remove SENSORS_SA67MCU
  dt-bindings: mfd: sl28cpld: Drop sa67mcu compatible
  dt-bindings: arm: ti: Drop Kontron SMARC-sAM67 module
  dt-bindings: nvmem: sl28cpld: Drop sa67mcu compatible
  dt-bindings: watchdog: Drop SMARC-sAM67 support
  dt-bindings: hwmon: sl28cpld: Drop sa67mcu compatible

 .../devicetree/bindings/arm/ti/k3.yaml        |    1 -
 .../embedded-controller/kontron,sl28cpld.yaml |    7 +-
 .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 -
 .../nvmem/layouts/kontron,sl28-vpd.yaml       |    7 +-
 .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
 arch/arm64/boot/dts/ti/Makefile               |   13 -
 .../dts/ti/k3-am67a-kontron-sa67-ads2.dtso    |  146 ---
 .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 -----------------
 .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 -
 .../dts/ti/k3-am67a-kontron-sa67-gpios.dtso   |   61 -
 .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   31 -
 arch/arm64/configs/defconfig                  |    1 -
 12 files changed, 3 insertions(+), 1389 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso

-- 
2.47.3


