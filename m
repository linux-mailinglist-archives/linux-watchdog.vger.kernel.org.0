Return-Path: <linux-watchdog+bounces-4044-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B80B3191B
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 15:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18B0518851AC
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 13:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA350304BDC;
	Fri, 22 Aug 2025 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9qqJqF8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D44A2FFDCA;
	Fri, 22 Aug 2025 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868568; cv=none; b=Db3MALt1CxzV93Uz/J/HMJ8z6coqXeH+6bvE31j325x0CQp44I3u3lIMXUMnjGakqYUAlrwt3cgw9M5BikIi5vDTouRcBUlyWFln48n/nHYBRJRzE7BEQU4R9GqfUTNGSqiJYOmyLX9lM08DpphPpQTdp9Y4A/ehSQIWunbibWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868568; c=relaxed/simple;
	bh=Z4N7E/ATatKbH4cDH2pW0yLzLs+JwnGudzv9sEzmXkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JpIBUDIZ/dAhgA1ERVMMU+fhwEU1yIMYqi4Y3XuR2BBNbc4k5HrwUpM4+Yzn+ex2r1UI3sQfTCadAwnTr2HauCQYmaJReTDYzYbMjTQluQ01g6+7Lclv/cI2k3gLnwpNMNMNY41PYnCmi3DO6+7L1fLAGNjnRk8d6oMvUKA+xoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9qqJqF8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE105C113D0;
	Fri, 22 Aug 2025 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868568;
	bh=Z4N7E/ATatKbH4cDH2pW0yLzLs+JwnGudzv9sEzmXkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u9qqJqF8cxZ+yFm28exnxYClwNlCvshsNwzS1xiCidbwyZoVkRRzZvSevHaF8YOmh
	 sR6bx5S/N7uXWz6G3HjIIXI7Qi7zE3vUhQ9vHZVcXurFBb6vn8YE9ZzEy6yiiuCnQp
	 AthcgRTahTHUS2Pw5Nav8zyJ+BqRmZ70gMbpc4CAjjF2CLHE0jlJasdqlowrU+PNun
	 X51QbgWaT1DGE5MKOvcjqA3WvhBPeOddaAcreT6vVjdLhHYIBcgP8dJbE2uxeIxe7u
	 Xf3dVMnlHlbO6uvKILUzZv3oC34639BIeey/PhcKuhGj0HoOmnb7kP2c6H0AQW+1NU
	 HycDVuyq1jDNw==
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
Subject: [PATCH v1 6/7] hwmon: sl28cpld: add SMARC-sAM67 support
Date: Fri, 22 Aug 2025 15:15:30 +0200
Message-Id: <20250822131531.1366437-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The on-board uC on the SMARC-sAM67 board is compatible with the older
CPLD implementation on the SMARC-sAL28 board, but has different sensors,
namely two voltage sensors and one temperature sensor. Add support for it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/hwmon/sl28cpld-hwmon.c | 76 ++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/sl28cpld-hwmon.c b/drivers/hwmon/sl28cpld-hwmon.c
index 454cc844fb9d..670308d9b72f 100644
--- a/drivers/hwmon/sl28cpld-hwmon.c
+++ b/drivers/hwmon/sl28cpld-hwmon.c
@@ -18,6 +18,9 @@
 #define   FAN_SCALE_X8		BIT(7)
 #define   FAN_VALUE_MASK	GENMASK(6, 0)
 
+#define SA67MCU_VOLTAGE(n)	(0x00 + ((n) * 2))
+#define SA67MCU_TEMP(n)		(0x04 + ((n) * 2))
+
 struct sl28cpld_hwmon {
 	struct regmap *regmap;
 	u32 offset;
@@ -75,8 +78,71 @@ static const struct hwmon_chip_info sl28cpld_hwmon_chip_info = {
 	.info = sl28cpld_hwmon_info,
 };
 
+static int sa67mcu_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type, u32 attr,
+			      int channel, long *input)
+{
+	struct sl28cpld_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int offset;
+	u8 reg[2];
+	int ret;
+
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			offset = hwmon->offset + SA67MCU_VOLTAGE(channel);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			offset = hwmon->offset + SA67MCU_TEMP(channel);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* Reading the low byte will capture the value */
+	ret = regmap_bulk_read(hwmon->regmap, offset, reg, ARRAY_SIZE(reg));
+	if (ret)
+		return ret;
+
+	*input = reg[1] << 8 | reg[0];
+
+	/* Temperatures are s16 and in 0.1degC steps. */
+	if (type == hwmon_temp)
+		*input = sign_extend32(*input, 15) * 100;
+
+	return 0;
+}
+
+static const struct hwmon_channel_info * const sa67mcu_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT, HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops sa67mcu_hwmon_ops = {
+	.visible = 0444,
+	.read = sa67mcu_hwmon_read,
+};
+
+static const struct hwmon_chip_info sa67mcu_hwmon_chip_info = {
+	.ops = &sa67mcu_hwmon_ops,
+	.info = sa67mcu_hwmon_info,
+};
+
 static int sl28cpld_hwmon_probe(struct platform_device *pdev)
 {
+	const struct hwmon_chip_info *chip_info;
 	struct sl28cpld_hwmon *hwmon;
 	struct device *hwmon_dev;
 	int ret;
@@ -84,6 +150,10 @@ static int sl28cpld_hwmon_probe(struct platform_device *pdev)
 	if (!pdev->dev.parent)
 		return -ENODEV;
 
+	chip_info = device_get_match_data(&pdev->dev);
+	if (!chip_info)
+		return -EINVAL;
+
 	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return -ENOMEM;
@@ -97,8 +167,7 @@ static int sl28cpld_hwmon_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
-				"sl28cpld_hwmon", hwmon,
-				&sl28cpld_hwmon_chip_info, NULL);
+				"sl28cpld_hwmon", hwmon, chip_info, NULL);
 	if (IS_ERR(hwmon_dev))
 		dev_err(&pdev->dev, "failed to register as hwmon device");
 
@@ -106,7 +175,8 @@ static int sl28cpld_hwmon_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sl28cpld_hwmon_of_match[] = {
-	{ .compatible = "kontron,sl28cpld-fan" },
+	{ .compatible = "kontron,sl28cpld-fan", .data = &sl28cpld_hwmon_chip_info },
+	{ .compatible = "kontron,sa67mcu-hwmon", .data = &sa67mcu_hwmon_chip_info },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sl28cpld_hwmon_of_match);
-- 
2.39.5


