Return-Path: <linux-watchdog+bounces-5032-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIyROcyEpWkCDAYAu9opvQ
	(envelope-from <linux-watchdog+bounces-5032-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 13:38:36 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5011D8C41
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 13:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90ABF306C7FD
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 12:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8262436DA11;
	Mon,  2 Mar 2026 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILueajBN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D52236C9DC;
	Mon,  2 Mar 2026 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454366; cv=none; b=P+cRXuWxdPK+Cu3Qs6wBsOIGxkaCmHwpgQ0eH4KNniVygPejDw9zQo8w/pgMj4SQCyVvMgBUw+aZL3aFZfv897rNeqdlPZ/HlDksl5LHhB5/EidFKMiswkKqidQ+1kXPEJjj0d5GUHlWnT+YRi7hgvlmHtnwb2gz0BVl10FkXBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454366; c=relaxed/simple;
	bh=yY+TZSmId9g+9Og/utITL4C/Pmxjg5Xby4QQjZzITSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBrlpPCaNSmc1bjIa8UH8CnrkSW/mwD8wwOnLmcZkzGUeq9ilsEqP6jEHX0poJKqL4xflQA6f4CUNIW2nT+wYyn3ZdFPZcNiedWBoNTRA868ffnzuikuxvbsktNYe2cYzLMmvB83ceBD25x3H8clakUdSHMcu1upoUzD5jEyBdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILueajBN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A786C2BC87;
	Mon,  2 Mar 2026 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454366;
	bh=yY+TZSmId9g+9Og/utITL4C/Pmxjg5Xby4QQjZzITSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ILueajBNT9jG/aLuqJs8XPiz2vcMyGf8VxkpP7GvdcU7Z1JR0hjIc/x61K73hvkkT
	 6xMGnkCsU8YRVvAcSbH4cTyrx+N23vhlED2SBadGHET3H8OfD5Opx9BG1OIbt5B7If
	 PVA/q2ryjyAS45DdBIExUW/p+L8DB5heAryyWDIH9SXVIDKNUxDDFafuctv6o6td3u
	 NfSgGwcKlk31AeAkeC/ujkcrGfJX/P6+lu0FvITFyLbt73KBXX7Y6ol66x90yBp6Da
	 C1QpbBNp7deASGUZTXRrUlK8kElp1BLBBzuGOw3ZPL9HFiqIhyQuEHJUj2pUw7IBuS
	 IsM95zMrbbfvQ==
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
Subject: [PATCH v2 2/7] arm64: defconfig: remove SENSORS_SA67MCU
Date: Mon,  2 Mar 2026 13:24:47 +0100
Message-ID: <20260302122540.1377444-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-5032-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B5011D8C41
X-Rspamd-Action: no action

Remove the SENSORS_SA67MCU from the defconfig because the driver was
removed.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee85..5fb4ae3588e7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -755,7 +755,6 @@ CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
-CONFIG_SENSORS_SA67MCU=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
-- 
2.47.3


