Return-Path: <linux-watchdog+bounces-3511-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E47AB9ADF
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 May 2025 13:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CF0C1B654CE
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 May 2025 11:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B12231846;
	Fri, 16 May 2025 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9dlIQuW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B3822F743
	for <linux-watchdog@vger.kernel.org>; Fri, 16 May 2025 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747394588; cv=none; b=GIfoTUeQ5mANwHDTB1d44W7v2uxLVJtEZRLdZrssIlGQzPcdZSZhXXfzpfdEhsieEh3xms/Lx3v9lBODX8DK07GikNBD/MWLGXzA/a35Pjn2f84g/R94+FUcc5stAqSuv6FrFyeRqLtRq2KLhw6JsCTa0Arm55h+gGClxWu4VIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747394588; c=relaxed/simple;
	bh=2j5qkobccot9LL1RM0m5iDEPEb8bSMGKA6Syb6/7mEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZV4xskuxtsw9Aiin24x64h9T1d73FouITNxZfTvw+nQkqi2cp3YUk/6mN1PWNOwc+buByQP18Bx2Foeqii8o5OdFi1jd+h35F/J8lRXSGyIK/PgHeFjxWSD241gZuwqNEpSbBSLVWGMH0xLbnrSgeqA5tqFHTViburlcP5c5Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9dlIQuW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3WmqR021314
	for <linux-watchdog@vger.kernel.org>; Fri, 16 May 2025 11:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3I2uY5YtBknRZgs8vRXNey7xsxmE+I1qZE/v1ysmnR8=; b=G9dlIQuWI1U5kXYF
	bfOSZgrRVn7CQZW7eBn5Z/2HgDKBRXwiHibG0WUNAAmj7pZ6Rw+BDKjfp0M8HoMI
	BqSApYwq88Uq7Aiba2k5ujcYI+56peCzsPl4bSmXc1TVIvcZTGwOGH4FNfoiTR0y
	GEOahr+90WUdNaqGtwgCjqtW2hCm1coUVzp0EUWFae4AuGMd8tfuRGGv18i4rX0h
	g4IHY7sURdf20ijRqFJC3Q2vL9vReNSuDXOseAjQgAWBSdGaQshQKgw4yroRwDat
	Zl5Xb3UbwrwhRfgInxtvd89Y+/S6sBo4ZAVNwwJoHMcNwO2xaoYU1ZKGDt+Ksu1G
	Ak65lw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew9khv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 16 May 2025 11:23:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8b297c78aso1804956d6.0
        for <linux-watchdog@vger.kernel.org>; Fri, 16 May 2025 04:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747394285; x=1747999085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3I2uY5YtBknRZgs8vRXNey7xsxmE+I1qZE/v1ysmnR8=;
        b=fynR3otnjP3c7OSgXKlKlU0L0cq/62yP1rYZlymRnUc7W6E9jHqViCsImG0SZX21cG
         27XmOX+Kyaoy5bFg00Isq/hrxlEk6P0ZYqF6Gpb6TIFA9VVQeWxM9FM/R1eg1fbKYirv
         oovfHsUrXvOLYSSLA9AC+zxCIyLwySZygZTW4a1m3ny8iY7NigUix+CilrCeUPdfdwrl
         YvOZW3iv/ze9cLFguTd5haM5mmPPRd+KIrzd45ArVL9xbarSlspEeBCCaYxOr4JqMEH6
         PjBfCqUObA8Efs7KgUvF42O23nh4BSpSu5xfLA9Wmt5EEk4wRGxQS2y+MzkCTkzA8XLj
         oSIg==
X-Forwarded-Encrypted: i=1; AJvYcCULX3qf0dvjdbPqDdLQcOlGyl+rDizaKbRGAUGNEE5LWl10EjjycHDmloepLzlLmycrHc0h1H3TE0Su8gAxrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVfkMNlNGPJyHnjPHhcaiTjRkPtgNlDrVLs9p2xTXSyP1pyaP9
	UpLEh43PTdD5VcmjNQN93+3GcYRTORbzykB4CkANTbtbP0EF6M9lIzsCKWCpZ7yX/te83TRs7VF
	hBVl4hck6OGlOoKGj0z/Zv0+V2pKu6Q3OA24ugzE8vygV+btQdCBsRegnwOm5OWBfxn/+Tg==
X-Gm-Gg: ASbGncsUNLROthlTpxD3VhsU2Q7HtH0ASObPSJUErRa6eW9YUNBMwCr2/NRuY5tjVng
	kaY1biitI6o4olMmm7T7Wy34y37hIHBihDAe78RqrLa0gc3wa3BrxZX8MkuWr5jRglsh6NIjFkE
	IaWsWdfWfjTLbcV07kf42nlQC9KTlI2Qx1Xb8RH1DwekaxWn1zxNFIoIirZUkj+4vDTqHH00xV6
	XGcZzCUGuWsfJEN8iFbbaFJ2+aWcda4f21JPwxAEMhjCXXt6es3+qV9PuwT7Hh+SPtS2ELjBWcP
	/n+r3QW9bGaTeWiM9kT8KbRMS8FgWjmGt/e7fNsH6rgIw3+1WnL+SoyiYIGM3HLjXA==
X-Received: by 2002:a05:6214:1c09:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f8b0835130mr20320856d6.1.1747394284664;
        Fri, 16 May 2025 04:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYedXsXWaYRFu3TMFMA0Ooxjh8cjz2T+AoU7nKygC1w6HBVJRE7mCkn7yTavhKYax2hXyneQ==
X-Received: by 2002:a05:6214:1c09:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f8b0835130mr20320616d6.1.1747394284092;
        Fri, 16 May 2025 04:18:04 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d502b03sm1287390a12.29.2025.05.16.04.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:18:03 -0700 (PDT)
Message-ID: <6274641a-7366-41cd-a0a7-a9e9cc41b8e6@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:18:00 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
 <68d280db-f7df-48c8-821d-f7d408c302ad@oss.qualcomm.com>
 <8a763c70-adcf-4a14-bb68-72ddc61fa045@oss.qualcomm.com>
 <8c2a53c2-c11b-4d49-bfb5-b948767ba6c7@oss.qualcomm.com>
 <1e871aed-705f-4142-b72d-4232ae729a37@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e871aed-705f-4142-b72d-4232ae729a37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O8h0HRjn6AdRlml1HML0dnIGpM2X2Z1k
X-Proofpoint-ORIG-GUID: O8h0HRjn6AdRlml1HML0dnIGpM2X2Z1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwNyBTYWx0ZWRfX5RzJp1QBlJhR
 +tfg2MrwDj1qD+uL/0jBCJnCPRZ1nT8qAUVAKda3tYHg+04giv57NtsY4CCw79WKGKjy9uY/GCl
 lVOzOMLGa78vJsjOruEyC9H9SmunwSJxkmxBEjjqcCcQEjwzrusmcY0BiLO33wSZstKCeaHRo60
 lrcjhrnVd2+snZigzeJlSLCNOHryEzvpUef/0NudZIZwlIAYXkVqYe5IB19FrJ8MwQmgXtdVmjK
 fc3Gjl7GPCp+mwfi/goo2iByMXumjSfxnyIlNtWSgFnmcCpdMbaxgCXH14PpQcH0G9zV1UF4yR9
 E9FMePh5gxFqcbGLa/JJ+Wy0uN7K6UEQaTtfluYA49Xvoe3H4XDm/x5zDWlIB7TjrwUr8jl3pYm
 1338JiWykUM7czT7vsu6qKjVbvtQ18xgd8WycPNntbKre1xOEavDJxjD2Nj17TvQczTJijwS
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68272019 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=IBNWLNMZBAz7KTYeBUwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160107

On 5/14/25 3:15 PM, Kathiravan Thirumoorthy wrote:
> 
> On 5/6/2025 4:31 PM, Kathiravan Thirumoorthy wrote:
>>
>> On 5/3/2025 3:53 AM, Konrad Dybcio wrote:
>>> On 5/2/25 6:28 PM, Kathiravan Thirumoorthy wrote:
>>>> On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>>>>>> +static int qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>>>>> +                    const struct qcom_wdt_match_data *data)
>>>>>> +{
>>>>>> +    struct regmap *imem;
>>>>>> +    unsigned int val;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>>>>> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
>>>>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>>>>>
>>>>> That way all platform specifics will live in the DT, requiring no
>>>>> hardcode-y driver changes on similar platforms
>>>>
>>>> Thanks. I thought about this API but it didn't strike that I can use the args to fetch and match the value.
>>>>
>>>> I need a suggestion here. There is a plan to extend this feature to other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT cause as well. For IPQ5424, all 3 cause will support and for other IPQ platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any case, can I define the DT entry like below
>>>>
>>>>          imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under value> <Overheat value>>;
>>>>
>>>> and store these in values args[1], args[2] and args[3] respectively and use it for manipulation? If any of the platform doesn't support all 3, I can update the bindings and define the number of args as required.
>>> Let's call the property qcom,restart-reason and only pass the register value
>>>
>>> Because we may have any number of crazy combinations of various restart
>>> reasons, we can go two paths:
>>>
>>> 1. promise really really really hard we won't be too crazy with the number
>>>     of possible values and put them in the driver
>>> 2. go all out on DT properties (such as `bootstatus-overheat`,
>>> `bootstatus-fanfault` etc.
>>
>>
>> Thanks Konrad for the suggestions and the offline discussions.
>>
>> @Guenter, I need a suggestion here. Currently as part of this series, we are planning to expose WDIOF_CARDRESET, WDIOF_POWERUNDER, WDIOF_OVERHEAT reasons.
>>
>> Once this is done, we do have the custom reason codes like Kernel Panic, Secure Watchdog Bite, Bus error timeout, Bus error access and few many. Is it okay to expose these values also via the bootstatus sysFS by extending the current list of reasons? Since these are outside the scope of watchdog, need your thoughts on this.
> 
> 
> Konrad / Guenter,
> 
> We had a further discussion on this internally. Outcome is, it wouldn't be ideal to hook the custom restart reason codes in watchdog framework, since there is no involvement of watchdog in such cases. Also I don't find any references to hook the custom values in watchdog's bootstatus.
> 
> If this is fine, I'm planning to resend the series to handle only the non secure watchdog timeout case. In that case, as suggested by Konrad, everything will be handled in DT like below to avoid the device data.
> 
> imem,phandle = <&phandle <imem_offset> <value>>;

the part before the comma is a vendor prefix, so that must be qcom,xyz

what are your plans for the other reboot reasons? are we scrapping them?

Konrad

