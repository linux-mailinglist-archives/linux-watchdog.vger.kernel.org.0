Return-Path: <linux-watchdog+bounces-4207-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F02B47C08
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Sep 2025 17:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E08C67A9A1C
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Sep 2025 15:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B99B27EFFE;
	Sun,  7 Sep 2025 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBNKIBsQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF111C6A3;
	Sun,  7 Sep 2025 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757258903; cv=none; b=JZCeXLXZFJK5nGub3IIEsdC3WdaxUeGanSDLlfJM08w3TFp7gI9SpbbnPcsemtRYQx1zm/uBlxawgBFHjhzlnX9l19ifVzV4BRZrcWTlMQplZNr8P2/LO93jk8Np0D+INtwe4qRaqdHeVDgQJwvAqIQKB4eHiG0Dd0atZXd4ygY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757258903; c=relaxed/simple;
	bh=32SAFrGqPnfqUlDQMicbyrfxFbEz2J3dVLd3bF1iLyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmvFnENBmTsUU1ijiClIijvAotsv1E7RDwmZehizIAz1tAKlpzBDwY3YIV6YwbxQmJiD264J54sxuvV1ot30/6pr2CRyw6U/xAmZL11fXWjC4DebOKU/RE/FwXVtng5bfGa2dfKEY3kdOx2+VnCVOA01yyd7hgJLJ4+7ppO26cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBNKIBsQ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso2755025b3a.2;
        Sun, 07 Sep 2025 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757258902; x=1757863702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4t1NPXSpsgumuAbcGzE1EyiDPKl7vf9eJ/hyZgqkMpM=;
        b=YBNKIBsQRim1mVJz+0bjl/EMIjqkMOTlruELeGMNLfqorTELnFrWV+uEfVP94fQoRM
         JLeSPb7uDGFBYFCYV+1qrClEmKyUtgBpPvPYSAA4VQrH8opk+2AcyXWJIo9gDncaajJq
         hQg3G82oamwxEnm8DsBV7eOxCtSxOmv3srOZ4BGbSVHulx4q/5m+A3eKAfZ//hlV/IqZ
         ethIIZ3LkuM+8hcolvUXGMO8a3/Fhe3C/ftob1eZoOSXHazQN7oyxM97+Yrwz/01nuYv
         Wk6pWZrb5MoBI6XpBdQVwrOVWYOKE4j39BXO96j/fmhFdhPx+DxYX7/7YSCYgBKeUKtj
         iizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757258902; x=1757863702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t1NPXSpsgumuAbcGzE1EyiDPKl7vf9eJ/hyZgqkMpM=;
        b=GIpbeETJy40/IhzPpwPoVyrfzUti5gPJNuERoDZhkIEl/l4qO8hjFgP7gvxy36zsnz
         65h9kIvFf0bfq4p9hDK7Qq7OQw23GijiDgz/ReXjAm/N0J36ZRR5wZLkm2gbvn5l7YH4
         T9yC8EXAqv8kfS3rG0dA/I7hXa6AEVz3rNXyrOuHMMp7uKCKGFgRJ4knhgpRSpNHQfC0
         6QXifzXtEuDM1v3eR7oz3FnAgkhavAy59XwI8bF6wmyQKtFlSQdvAMPKhPXMembbOkP+
         kvbyfQ1sMEyMKpEUYfnRpcas8cMJJ4t68Mj5cxGVjEOvKHsMwUILBOTYnI353l84xypb
         VdEw==
X-Forwarded-Encrypted: i=1; AJvYcCUoaL6xWzKkkFcnKEIh0EoQWSngQvSyLXHN4U3ABEFVoGFIPj2A7Z7g56lk1HG854kkQTWwT7BUC4JK@vger.kernel.org, AJvYcCWBCBmUJSYmFJJ8aQ1MLQi93FyjeHOAz08L9HHPCEk8TDwzGk5xWZaILrpWt4BjZmMt/BLNPJBCauHk9asPqOQ=@vger.kernel.org, AJvYcCWJDaITdn0jawsAm2TMbFZ0SB9pOO0gBbPeaWJI5GTf7xPmNFOc42pHD91ThcgxmjkT5NOnUsZTuW8VZqCx@vger.kernel.org, AJvYcCWK6szy1EgbB8bq3znYZvXbdpqnv8vJom1eEXBPvWyOwxttAYGvSMTQ2Xq68Nj+eRDbBLKMOOSAqVFsCDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJaKMEkVIoiyDTHuQdmOYVPEm4a4wgpsDAyspKFK3CcgrqbAHV
	wEmnS0Mc23399y/R46kaUjCoYP5Tj4ka9MUHitTBO11/GKEXnvmN8nNA
X-Gm-Gg: ASbGncvC8by6ewxTHtOdhB4/0tobqF5dvJA25qFcSKXx7KYEOe/98hySIZ3F+c1uqO5
	6wfJLZDsvvqtUkqfhPZNlR6tI5KRwUM458chqlR2I9jmCP8x5qPvdeMIJIuHeUiISNVWc2b/zDv
	Jbe/cEbp87SFsU/Pg4pg217rtL3HzA+XXZfXLhxnI3OmgIP6yMgoQqpUMiFCiTrlzEj0zdFvNOS
	Mt4R5yh31YalOrUWBaPb5gZ+Ok9yO5O+TCVoCOYVbw+FEXn7VL0F8eUJTCMcfKYfzMK9gAoV9mD
	zmcxchIAwf87Ch7Iwdba2zgU1VbnSzEj9i/r0AIeUWt5X9olJFgygMhVcYloTX5v8LXq+ETKeX+
	htX/xWk9qXb1BJw3W2Jqdlf/1pM+TNMzKTwj4S8hCXE+jBQlnWg2mp5ipeXHO2YuKJ+vAb24pDP
	869FLH/A==
X-Google-Smtp-Source: AGHT+IGE6MiuigF2nMYzx+KzSDUOLA3WaN9Jrarc3HfPkx+hCejQIAa0ADWq74RTvhd9q/v/3azFVQ==
X-Received: by 2002:a05:6a20:9183:b0:246:9192:2789 with SMTP id adf61e73a8af0-2534441fa83mr7672424637.49.1757258901631;
        Sun, 07 Sep 2025 08:28:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a2851sm15985846a12.37.2025.09.07.08.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 08:28:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <83189bf7-6831-4373-a352-2a3a05526e08@roeck-us.net>
Date: Sun, 7 Sep 2025 08:28:19 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] hwmon: sl28cpld: add SMARC-sAM67 support
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822131531.1366437-7-mwalle@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250822131531.1366437-7-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/25 06:15, Michael Walle wrote:
> The on-board uC on the SMARC-sAM67 board is compatible with the older
> CPLD implementation on the SMARC-sAL28 board, but has different sensors,
> namely two voltage sensors and one temperature sensor. Add support for it.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   drivers/hwmon/sl28cpld-hwmon.c | 76 ++++++++++++++++++++++++++++++++--

Documentation/hwmon/sl28cpld.rst would have to be updated as well.

...

>   static const struct of_device_id sl28cpld_hwmon_of_match[] = {
> -	{ .compatible = "kontron,sl28cpld-fan" },
> +	{ .compatible = "kontron,sl28cpld-fan", .data = &sl28cpld_hwmon_chip_info },
> +	{ .compatible = "kontron,sa67mcu-hwmon", .data = &sa67mcu_hwmon_chip_info },

Effectively this means that the two chips have completely different functionality.
One reports fan speeds, the other reports voltages and current.
This should be a separate driver.

Guenter


