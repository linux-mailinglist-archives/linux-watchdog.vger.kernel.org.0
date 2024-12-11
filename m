Return-Path: <linux-watchdog+bounces-2533-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DE9EC5FD
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 08:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F9A018872D8
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 07:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9811CBEAC;
	Wed, 11 Dec 2024 07:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rO4+xvLw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2201C549C;
	Wed, 11 Dec 2024 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733903428; cv=none; b=W5RS9MztbDX6xiDmBQ7o50crZidRWqlI29uq4SVC2331hZut6QgBbBzrHga0TJ6IYMj77pS6r8N7VFVSFc4V13AXHw4OakWDwxkq8lQiF0Uxi2xhiZpNKLSMvrsc6RFsL7I7rYmuYEE/lhHaHqBU6i3kbWlP7NaRMcq4v2mFlRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733903428; c=relaxed/simple;
	bh=MmPHj0pwv2OtXI3VvPcYeeP6Dhxai8bzgo8E4r5hKls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhHs/MHVZNuVAj0AOMJFiNpClgX5Y94FjHUizKwb+cknq9sohHFPZSn7uDjxiNFZ+Z1V7LD7IKpkRroCq+HlZQSRxV28IHWPWcYLQ2RqXNqDAteJN3r9Zwze7W9uoNKnOA0TZhDBuNJ6YBTwT7meANxYTbol9oM2pLAFgu1loks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rO4+xvLw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC20CC4CED2;
	Wed, 11 Dec 2024 07:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733903426;
	bh=MmPHj0pwv2OtXI3VvPcYeeP6Dhxai8bzgo8E4r5hKls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rO4+xvLwar3oyiZPO6sG1lctWzE1npoy0MkUKR+QbCYw8/wwW2J5lMVlNc6PqawUH
	 XjiqjbnoZPJi7fx95io9DrVM54SdVuCz91VKk+H/GbZMeOJKFxrPwcjtTQmoYCmHKQ
	 4i6qqoU8axpFrNNP3Njr7FSOUpou9WI/ondknOpKugPw0RlFeu2M+alg76ZjNSdrqT
	 dAhBMd/8ak0BxBdkyArw9fGw6H1I3ovwscdxHs7syHZeca3Czg8PhTdwWhQPnkRyru
	 vWGpC5ZzX5/aTUSfkR8wZEVTG9j+hE/BBuO5I6KZd5eiDPJ+7DDiz/MdJkDlMe3IVg
	 S86c7UgHKk5GQ==
Message-ID: <5ac02c0e-d245-4c05-a4df-2cd2ba9065ad@kernel.org>
Date: Wed, 11 Dec 2024 08:50:20 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] arm64: dts: exynosautov920: add watchdog DT node
To: =?UTF-8?B?6rmA7YOc7JmE?= <trunixs.kim@samsung.com>,
 'Wim Van Sebroeck' <wim@linux-watchdog.org>,
 'Guenter Roeck' <linux@roeck-us.net>, 'Rob Herring' <robh@kernel.org>,
 'Krzysztof Kozlowski' <krzk+dt@kernel.org>,
 'Conor Dooley' <conor+dt@kernel.org>, 'Alim Akhtar' <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 'Byoungtae Cho' <bt.cho@samsung.com>
References: <20241206025139.2148833-1-trunixs.kim@samsung.com>
 <CGME20241206025156epcas2p4c55f230accc4354e6f4bf324ab9a5833@epcas2p4.samsung.com>
 <20241206025139.2148833-2-trunixs.kim@samsung.com>
 <510e826d-a434-437d-8d2e-3f2618c28b7f@kernel.org>
 <000101db4b6f$0d31c460$27954d20$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <000101db4b6f$0d31c460$27954d20$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/12/2024 02:50, 김태완 wrote:
> on 11/12/2024 01:50 UTC+09:00, Taewan Kim wrote:
>>> From: Byoungtae Cho <bt.cho@samsung.com>
>>>
>>> Adds two watchdog devices for ExynosAutoV920 SoC.
>>>
>>> Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
>>> Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
>>> ---
>>>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 +++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
>> b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
>>> index c759134c909e..7b9591255e91 100644
>>> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
>>> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
>>> @@ -183,6 +183,26 @@ cmu_misc: clock-controller@10020000 {
>>>  				      "noc";
>>>  		};
>>>
>>> +		watchdog_cl0: watchdog@10060000 {
>>
>> You need to do careful rebase, not just accept whatever tools shown you.
>>
>> This is now placed in incorrect order - not keeping sorting by unit address.
> 
> I seems to me that the addresses are sorted correctly in order. 
> Could you kindly check again?
> 
>         clock-controller@1002_0000
>                   watchdog@1006_0000 
>                   watchdog@1007_0000
>     interrupt-controller@1040_0000
> 
> And if there are any rules I might not be aware of, please let me know.


You are right, I got impression last was 1004, but that's 1040. Thanks
for correcting me. I applied now.


Best regards,
Krzysztof

