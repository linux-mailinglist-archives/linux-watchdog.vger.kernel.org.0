Return-Path: <linux-watchdog+bounces-4329-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA6EBBE217
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 15:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079C91882741
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 13:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68FE28C86C;
	Mon,  6 Oct 2025 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvV7V9yZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B228AAEE;
	Mon,  6 Oct 2025 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759755848; cv=none; b=TNU5Z7lEw5J2BAmFKMEVQnndkiQlhxGl9w016zABZ3OvnQ2RWq9QDMWSyO4sJQKMRsdaHZhRlnfUsbcnp6MnChRcuXu616nyVTCJJaU4gMo41t7uTPHQMaL1bO/ezfUjGfj69seoglbXQGlAbBscPmEKZVOfzMy6/ihz2JFoKVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759755848; c=relaxed/simple;
	bh=WSc5N/iAmPiV35Hsw0XqC+hCf7iMvLKfpL2U3kMvVDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HANI0rGSERZ3mGQxtxQ9XuVbPS7AdqlUrTCYNW2Tc34GgZTMkz5IslHF3h1wB7oRYgKqq894RizOHdZoDOF/y9VGqt6lxHPrXVrPaB84bF0gjnAyz52ubhh5sT27WAdAbarli78G51B8pA+RIWN/9wix0c78mM+tHdI5GBGm5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvV7V9yZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F78DC4CEF5;
	Mon,  6 Oct 2025 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759755848;
	bh=WSc5N/iAmPiV35Hsw0XqC+hCf7iMvLKfpL2U3kMvVDI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SvV7V9yZ+2xYX8o3g05bKrYskbBcBtqdVMjjhiWSLd6EDBy2I6NoozVssVhg+Q14W
	 O1o2CRLjvWfCjEeBc8hVyS/Y4seu7z0Z+oOTPShoLBx2+LFuFu1VROB1ySBQUhyK54
	 kRoF/B3Kef2VH85nm251E659Qc45CijQ9youUzsNQwzlZ+B50WCKTMhXoUDvmBZiZV
	 b47wUVsDB0pIB7dgvK8m2yWXh0XtbqZmWlfgW+A+X8EfQffHrQa0EbDCLYXts1fTMQ
	 uYI4viMzl8R7LOWMlWlEqOTQnflvUrgb3kGq0ruC07W8+5GHYjMFdUAM2uJdoLb8Gp
	 AGJooiDW2vIDA==
Message-ID: <b94d8ca3-af58-4a78-9a5a-12e3db0bf75f@kernel.org>
Date: Mon, 6 Oct 2025 22:03:59 +0900
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: Add driver for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com>
 <3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org>
 <a7633abf-0005-423b-b152-e8c70aa5c27a@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <a7633abf-0005-423b-b152-e8c70aa5c27a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/10/2025 19:03, Pavan Kondeti wrote:
> On Mon, Oct 06, 2025 at 05:56:42PM +0900, Krzysztof Kozlowski wrote:
>> On 06/10/2025 16:37, Hrishabh Rajput via B4 Relay wrote:
>>> +
>>> +static int __init gunyah_wdt_init(void)
>>> +{
>>> +	struct arm_smccc_res res;
>>> +	struct watchdog_device *wdd;
>>> +	struct device_node *np;
>>> +	int ret;
>>> +
>>> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
>>> +	if (np) {
>>> +		of_node_put(np);
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
>>> +	if (np) {
>>> +		of_node_put(np);
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
>>> +	if (ret)
>>> +		return -ENODEV;
>>
>> No, your hypervisor driver (which you have) should start the module via
>> adding platform/aux/something devices. Now you are running this on every
>> machine, which is clearly wrong...
>>
> 
> This is a good point. Thanks for bringing it up. We don't have a
> hypervisor glue driver (yet!) that can add an aux device. Based on v1
> feedback, we would like to be a standalone module that can self discover
> gunyah hypercall interface.
> 
> Currently this driver depends on ARCH_QCOM || COMPILE_TEST. So,
> technically this can be built and loaded on all non-Qualcomm machines.


Not technically, but practically. We do not make single-platform kernels
anymore, it's not 2010. Entire arm64 is multiarch.

> 
> We can make the STATUS SMCC before looking for the other watchdog
> devices and fail early.
> 
> Our Gunyah glue driver [1] do make SMCC call to establish that we
> are actually a guest under Gunyah. Since our intention here is to
> support watchdog on as many as platform as possible, it is better not to
> tie this with glue driver and make it a stand alone and self discovery
> module.


I think you should have only one driver pinging for Gunyah, so glue
driver or this. Not both. If you add such SMC here, then how do you
determine the platform in the glue driver? Via DT? Then DT supersedes this.

> 
> If this is not an acceptable solution (Please let us know), we can find other 
> ways to limit it to only work on Qualcomm machines. For ex: Socinfo
> platform device is added from SMEM driver which make it only probed on 
> Qualcomm machines. We can look into this. 


To me socinfo feels even better. That way only, really only qcom devices
will execute this SMC.

Best regards,
Krzysztof

