Return-Path: <linux-watchdog+bounces-4428-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 733DAC15D9E
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 17:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1C623B321D
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 16:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A5A2874ED;
	Tue, 28 Oct 2025 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLmpobQi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0EE285CA2;
	Tue, 28 Oct 2025 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668982; cv=none; b=Rf4948a9ucEBtg/tlTGl4jIwUB1u166Fm2DBbcxO3y2n+URZfBtM5WlrKBbw7FcW2wi025deEBDTWw/ePC5yd7+v8YHBjEYZAQNQbdUP4gq23BdAnx2jBDf/+ivrv9I1/orsRpcmc8G3IGauvALPwcd9d/1jXhEm8RLyUBvJmE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668982; c=relaxed/simple;
	bh=U/1tZgh4GgLt+Eg5UD+RF0IXw1jsdcl5mI9mP5+MA+c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TJd7u7tK8AOweJ4agg/L39W8lLMl4nt+LLB4ArwEZUf0upf1JmrkLMdehi61stJCck+2iidt7arXrTmFoSM4+PZ3TKqkzpMqLOAqcpDRJGcc1RlGChG4BIG8Unk8vAMtg3WXxgu1XYVNzmiX6IViCtCrWZv5Sr3WccjkYfVqT+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLmpobQi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2875C4CEE7;
	Tue, 28 Oct 2025 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761668981;
	bh=U/1tZgh4GgLt+Eg5UD+RF0IXw1jsdcl5mI9mP5+MA+c=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=kLmpobQikDxWT7WUdhZnPPHgea1mKVAOrBKSRVvtZX69Uy8vu6zY7cZDT0q7rpCmh
	 YRl0wLJa5t6nmpSOW+0zUrCwHR8LZXuG8ANGGOfqpIynlTOCZJAYmXEr+/GWKSm/Ul
	 YRanH8hzVhK6TDWi82HmhL/CRvw20Jc54n1I6NYDO++3sSJcn848NGsH+EX0Vz5M+p
	 3bB0ptknTwcE3LaPXGXfoO18aW+BsDNJsRPy4nPmWEUVMDZCj7tEr1LuF5j6sDNDM6
	 icwM7tPD+rqkUsY7itnr66Xs8RmtHF+RPaV/UsCYcm1cN2pT8FIpRQx6ut1KuQGaus
	 bi6wHFVnZCiCQ==
Message-ID: <7f49e7cb-c102-4e89-9aaa-73ba2998f4fd@kernel.org>
Date: Tue, 28 Oct 2025 17:29:37 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
 <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
 <76479593-c47b-41a7-8349-5d7c1403f7c0@oss.qualcomm.com>
 <73955d58-544c-4299-a099-bfd9e5912a40@kernel.org>
 <636a1f99-acd4-4904-8fae-f159646cc1a0@kernel.org>
 <f4d80be9-986f-4d37-9c25-725eff7bb653@quicinc.com>
 <e03373d9-e2dd-48b6-93a6-554fcd623718@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e03373d9-e2dd-48b6-93a6-554fcd623718@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/10/2025 17:17, Krzysztof Kozlowski wrote:
> On 28/10/2025 13:27, Pavan Kondeti wrote:
>> On Tue, Oct 28, 2025 at 12:07:40PM +0100, Krzysztof Kozlowski wrote:
>>> On 28/10/2025 12:04, Krzysztof Kozlowski wrote:
>>>> On 28/10/2025 11:58, Hrishabh Rajput wrote:
>>>>>
>>>>> On 10/28/2025 3:10 PM, Krzysztof Kozlowski wrote:
>>>>>> On 28/10/2025 10:35, Hrishabh Rajput via B4 Relay wrote:
>>>>>>> +
>>>>>>> +static int __init gunyah_wdt_init(void)
>>>>>>> +{
>>>>>>> +	struct arm_smccc_res res;
>>>>>>> +	struct device_node *np;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	/* Check if we're running on a Qualcomm device */
>>>>>>> +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
>>>>>> I don't think you implemented my feedback. This again is executed on
>>>>>> every platform, e.g. on Samsung, pointlessly.
>>>>>>
>>>>>> Implement previous feedback.
>>>>>
>>>>> Do you want us to add platform device from another driver which is 
>>>>> probed only on Qualcomm devices (like socinfo from previous discussion) 
>>>>> and get rid of the module init function entirely? As keeping anything in 
>>>>> the module init will get it executed on all platforms.
>>>>
>>>> Instead of asking the same can you read previous discussion? What is
>>>> unclear here:
>>>> https://lore.kernel.org/all/3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org/
>>>> ?
>>>>
>>>>>
>>>>>
>>>>> With this patch version, we have tried to reduce the code execution on 
>>>>> non-Qualcomm devices (also tried the alternative as mentioned in the 
>>>>> cover letter). Adding platform device from another driver as described 
>>>>> above would eliminate it entirely, please let us know if you want us to 
>>>>> do that.
>>>>
>>>> Why do I need to repeat the same as last time?
>>>
>>>
>>> Now I see that you completely ignored previous discussion and sent THE
>>> SAME approach.
>>
>> Our intention is not to waste reviewers time at all. It is just a
>> misunderstanding on what your comment is about. Let me elaborate further
>> not to defend our approach here but to get a clarity so that we don't
>> end up in the same situation when v4 is posted.
>>
>> https://lore.kernel.org/all/b94d8ca3-af58-4a78-9a5a-12e3db0bf75f@kernel.org/ 
>>
>> You mentioned here
>>
>> ```
>> To me socinfo feels even better. That way only, really only qcom devices
>> will execute this SMC.
>> ```
>>
>> We interpreted this comment as `avoid executing this SMC on non qcom
>> devices`. That is exactly what we have done in the current patch. since
> 
> 
> So where did you use socinfo? Point me to the code.


To recall my previous feedback:

"No, your hypervisor driver (which you have) should start the module via
adding platform/aux/something devices."

"To me socinfo feels even better."

And you ignored both and took some further part claiming that
invalidates previous feedback. I don't know how to stress it more. You
really do not read what was given to you.

If you call any module_init other than module_foo_driver I will keep
NAKing your patch because it is wrong. I explained why wrong already
multiple times in previous threads and other discussions.

Best regards,
Krzysztof

