Return-Path: <linux-watchdog+bounces-4942-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INhYLOakjWlh5gAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4942-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 11:01:10 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F6D12C246
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 11:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 506CF30DF1B5
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 09:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B5B2E6CD9;
	Thu, 12 Feb 2026 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Qx7j6msv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58A42E54CC;
	Thu, 12 Feb 2026 09:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890280; cv=none; b=XSUTfTledQxO6YyZPmVVntYA5ciyFAk7GH9Z5ab5FfyRtFZPJio8BFxppK1Z+8NcYRUr8xay5cVGDwdHPe1KxTo/cV5nOZODsVIJW1IJGXTDrEh1nSkKJZcWQqpTxcJ7Qpy2DiTL2+yRgNr2wEZaNy+aagt4bRoC3ILohD9Xd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890280; c=relaxed/simple;
	bh=iI/SDCfh9dwezKTtvQ5Eybbk3cWcaOxqf8BgHUVGu8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvcX49apzOj0Se3VIfcS8kbQlp+Okeh+NWrE+K60IKvbMrTPspH+6DOIXbV7JfOKK1lvt6mUfxXEO/TnjgglzpMWK7F5khQ1vuygiq1uvlntPWyii3csiphulSWAs9GAnetiCcqkJqsgTLGOFo4ERyqA+WeO3Q52li3VjPIW/4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Qx7j6msv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770890277;
	bh=iI/SDCfh9dwezKTtvQ5Eybbk3cWcaOxqf8BgHUVGu8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qx7j6msvSlwIPvhIdnaGJURYQJkiClQGtAQfeUMjbThdUhwbtD9koTFe30N5bQIdI
	 FfIWh7nHzqo4b6RTawfBl4XbzBXO7IlCFn9K91gB03B4F+oTBpVfcD7P/7Bhvs5h5r
	 1Io7K5e/NB+IfMj3SMejAhjBQV+qSb3CQBW8b/+VfhMep11NCKOU1fQbYgi72ydSLY
	 SY+ebUYoCvIlL3FbRcV0wHnbjoDQMM1SBZPwQfUlMYpe85yXmIqofgRx8151AmQb1E
	 yqrXotGuKvxk8Rwb5DY6jC3bYANmqGMlbuahyp60zjeZV+jg5TdiMLly2mFtkRgV01
	 /qihAKdQ/E9dw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93A7917E1305;
	Thu, 12 Feb 2026 10:57:56 +0100 (CET)
Message-ID: <01682ecb-b3bc-41de-94e0-83271ba121a4@collabora.com>
Date: Thu, 12 Feb 2026 10:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: mt8167: Add the mmsys reset bit to reset
 dsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
 <CAORyz2LRkVcOss3vFS3Y3FtZfn_s-Um8G9JLgedXEeySorr0=w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAORyz2LRkVcOss3vFS3Y3FtZfn_s-Um8G9JLgedXEeySorr0=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4942-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[0.213.225.232:query timed out];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-watchdog@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,gmail.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[syscon.0.213.159.128:query timed out,lscorcia.gmail.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.213.225.232:email,collabora.com:mid,collabora.com:dkim,0.213.159.128:email,0.213.206.96:email]
X-Rspamd-Queue-Id: 53F6D12C246
X-Rspamd-Action: no action

Il 12/02/26 09:01, Luca Leonardo Scorcia ha scritto:
> I apologize for the mistake, I did not notice that the dsi node is not
> present upstream yet, so this specific patch won't apply. Any comments
> are appreciated though!
> I will send a separate patch to add the display nodes to the dts and
> the required compatibles to the bindings.
> 

Initially, I didn't notice either.

P.S.: resets goes after phy (alphabetical order)

Cheers

> Il giorno mer 11 feb 2026 alle ore 20:06 Luca Leonardo Scorcia
> <l.scorcia@gmail.com> ha scritto:
>>
>> DSI hardware reset is needed to prevent different settings between
>> the bootloader and the kernel.
>>
>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8167.dtsi | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> index caf51f203dd3..ee2792d53b2c 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> @@ -8,6 +8,7 @@
>>   #include <dt-bindings/clock/mt8167-clk.h>
>>   #include <dt-bindings/memory/mt8167-larb-port.h>
>>   #include <dt-bindings/power/mt8167-power.h>
>> +#include <dt-bindings/reset/mt8167-resets.h>
>>
>>   #include "mt8167-pinfunc.h"
>>
>> @@ -189,6 +190,7 @@ dsi: dsi@14012000 {
>>                                   <&mmsys CLK_MM_DSI_DIGITAL>,
>>                                   <&mipi_tx>;
>>                          clock-names = "engine", "digital", "hs";
>> +                       resets = <&mmsys MT8167_MMSYS_SW0_RST_B_DISP_DSI0>;
>>                          phys = <&mipi_tx>;
>>                          phy-names = "dphy";
>>                          status = "disabled";
>> @@ -295,6 +297,7 @@ mmsys: syscon@14000000 {
>>                          compatible = "mediatek,mt8167-mmsys", "syscon";
>>                          reg = <0 0x14000000 0 0x1000>;
>>                          #clock-cells = <1>;
>> +                       #reset-cells = <1>;
>>                  };
>>
>>                  smi_common: smi@14017000 {
>> --
>> 2.43.0
>>
> 
> 


