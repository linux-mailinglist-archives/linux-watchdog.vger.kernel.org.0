Return-Path: <linux-watchdog+bounces-2214-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBE099EFDC
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Oct 2024 16:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B1411C228AA
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Oct 2024 14:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2E71D5140;
	Tue, 15 Oct 2024 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEOwdjsw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01E91C4A2C;
	Tue, 15 Oct 2024 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729003257; cv=none; b=NY5i+ls9l+KkhLxiNXaWEuF5LBlrhdLi0ibBcyRFm12PYO+E5VQ3YEoNluHAs+hb3i7+1myWYFi5WBOXj0roM0B/v3v5iE3OVwWK3ATG1Lka+gl2ubZxlQi/YakkNWbBTQXJcVhIyjMqo3ZI6No//rJIHEH4pJzNjvexgoJsY6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729003257; c=relaxed/simple;
	bh=h45voZ3l33ty37RQF0W2WNSzAywOCLZGEWusIeq6Kuc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qtU/LOODE6i7hvho8zQKZ1M94n+sWAfeCQclQI93KU7qAB1A4MqAUqapyp1id0Rnkas1sAJuMS8eQjAJ48R6bRTiguY72ZE1krkrSWblBEg+3JgIi/H7wKfw8bAqsLhYv1wmOM1wsadq0jr8Lk542HUnxpCrTZVmW7m8pv2h7Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEOwdjsw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2FAC4CEC6;
	Tue, 15 Oct 2024 14:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729003256;
	bh=h45voZ3l33ty37RQF0W2WNSzAywOCLZGEWusIeq6Kuc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lEOwdjswxHb/fngcBMbmH7c/lymo/+exHYs4FoQWCtL8YM2yFNgoHs9PMaEikcpVP
	 wnw/Kc2BRu9HA2JAfAuLUEu0jQHC42neuZ4a0RnNYHbj9dGwY3kMzhjjDRI0+5TgnE
	 bw/uO3oPYyMCSIc1tyu5Uxw+1nVpFVRS7X8nZs0iZkDH9kgyDW31L1BD8XntFm3aSB
	 b6DMdndcSmtkStcUkcl0UTtieiBa6G/GyVCBJFYKuABmWs5DFO2/O/6fump97C8NMf
	 7GsbArSpUUdjpkYCuHQ3X3rh8RDCPpTd+V/G74IYBHrPdO+gCMBpjDZ3t0YjbLVYNo
	 aH/916hbn5ZDg==
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
Subject: Re: (subset) [PATCH v2 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Message-Id: <172900325306.630549.2100737513482910527.b4-ty@kernel.org>
Date: Tue, 15 Oct 2024 15:40:53 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 10 Oct 2024 11:42:39 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> Additional Changes:
> - Remove mfd parent node at example.
> - Ref to backlight's common.yaml
> 
> 

Applied, thanks!

[2/5] dt-bindings: backlight: convert zii,rave-sp-backlight.txt to yaml
      commit: 0eda30af58809224d80dc3bf3f368fc677fe8c08

--
Lee Jones [李琼斯]


