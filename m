Return-Path: <linux-watchdog+bounces-3514-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B748FABA0D5
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 May 2025 18:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A95FF3A9B5D
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 May 2025 16:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6AC1C84B8;
	Fri, 16 May 2025 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzZKB86H"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8261B9831
	for <linux-watchdog@vger.kernel.org>; Fri, 16 May 2025 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747413323; cv=none; b=QrL99rDRy1Ab+jZX4KvY+yvcXHlrdseCzVaXTZe43IRt18ziVED4WhSg2cJSoXgh/BxN1Ajv+hD+Xu5Gw08AR3mUjxjYYODD794WnBvS+nFEV2x03QmFNJnUHRFRfKpxDU48OgPbGkES90ylZvgGl5JGo1ht5yhFUugX/xiiLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747413323; c=relaxed/simple;
	bh=es/iLpQ7h491Bm1ao/ZtHs92YEBYb8fiiply/JOiIR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9jAThNMOVAFEq9rkdqjygnV/VdZZEpVD1r4mH9fudfQQbRexMNaZNBbTs0NB7sX9X4GSPIRaGpvGsKoOSIF0kG5yKarUtIuCBEd1F8n1BD8Ac9dbOkSWKM6A9uY9lQA0922I1YXtWYRwWPEQpNpC2gDeBP240DNyOUd3jDKS7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzZKB86H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBRvnb023359
	for <linux-watchdog@vger.kernel.org>; Fri, 16 May 2025 16:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTmwEqQ8XcBgL6KMnmGn0Js5nNwnbxm2fJwGxsiwNzw=; b=lzZKB86Hz1wJz1yL
	SCH9OoTzfYdnDjPGW1XLSuIF1HEvwIcANflxs80nIOLJiWiXIqv5iXpHTy/MepnY
	ofN4THVwZ4he4iZGIQpcgXnjIbcwYB5FATPK3DILd+0qeQVeH9OzJbjup0V97+UG
	6HYodvtDQm2qgxlXK5JZNBTFhd3mi3SYFCTbL4+gxemvmETLA5j8VI8uvZWmmMsJ
	kTlxHqSxnfQNyhQxOFA7hEX3hk3OqIEspRbTisvEEuy/Yq9SyRji4P1uGLgZRYei
	Uk4jYSogWz+9g9YH9EuA/FNZh6myfh29qTVtm+S9omoqDUEPg/FTC5StCuC7e9ES
	KXzX4w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p4gq8u7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 16 May 2025 16:35:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8aab0a94cso3378756d6.1
        for <linux-watchdog@vger.kernel.org>; Fri, 16 May 2025 09:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747413320; x=1748018120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTmwEqQ8XcBgL6KMnmGn0Js5nNwnbxm2fJwGxsiwNzw=;
        b=QVN7p7p1xpXa5VAfsQsZYe/QnQIEi69d2oD+Hn70yCtjhCCaNNY4KdEkHBGLowx1bD
         Ap5M2GRnisJcpW2yWq0/GeNATrLRi5QyI1/TIE2n+FHyAqsB6v+9S5cHd1gHI4opsXhh
         avEXvEDY81foADzL/tj+TrxWyo2SY4G3JmG9xPfFNd7LEFuaw6ZrwfnR195CQ95wcbMW
         /SG+bg+6lHXM8tZw43UCeyPxJqXsg9nJO23btdq+z+M17g9mJv2GafcWKUnStMtmvtkH
         cXTWd8BMC47q9/4kfLOxgp9mxL+3ua9M18NwnDvS4a/fmi9sv58O2Q3TZ/Lu6lstRejs
         wjEg==
X-Forwarded-Encrypted: i=1; AJvYcCW4ONV37WM5WC3K47oRkJVEtdqI2cOr7JXI2HauIgHQRqIf4QPwuyQrQuNT9t2qrhD3/dy1kamIpIDFcWeByA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx2DS77cNugq2RAYtQA6Tn9m/t/g8qVCAUSTgzKeRH2IaLuHKb
	QctUhETJ74t5qC+Akf0dea64GzAoYF0f6UDM17xid+U7cjRoRsVM/0wOfUYETgYIxd8t+V+sgFM
	Z+OwHWai04rae0RcNj6eKT0BknN645VUiLrlYw92CW/nMZRKCDpcGoQQwWBZYj6s50DIkSA==
X-Gm-Gg: ASbGnctgHD1nkXoBLsoc3iBgQECkdc0K+CF0+rKH3ggLhjXzsro7hF0HAE4W5v3ePA/
	Iu5fGCr92F6CWRJjVhuc7lObkzCtCrMldPPtcmLsPYExXQ1/52HZi+2aed3klZIGLQe2Fq1VNZe
	mQcOHyvry4VvNjvecJZAqZU8jt2hK+yXi06LbySTALCuso0ADgta7YwMrUDQVNLOLWz0Gm5UutK
	iFq1491LOABM1zIo0FLJLLNJTUOrlM22BBLcV8VHpoLxkaKe4gTkIYqwz3gQP/isEZ+3FaFhAbm
	H3nf6XLaixvS5s49Kmgz4pLvZGzvNPjQYcJJhW+hFZPXYDGjaCTKwMBMQu6vAr/WEQ==
X-Received: by 2002:a05:6214:21e8:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f8b09029a2mr22550056d6.9.1747413319517;
        Fri, 16 May 2025 09:35:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrejNuXm5xcNzQ2NQrSkT0Ek+i35JQqkBQixmZL/6pvDp3di/K8cA/Ni3c15xUoOUfouZokg==
X-Received: by 2002:a05:6214:21e8:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f8b09029a2mr22549896d6.9.1747413319075;
        Fri, 16 May 2025 09:35:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4909e1sm178126666b.125.2025.05.16.09.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 09:35:18 -0700 (PDT)
Message-ID: <21bd89b9-9f6e-42d0-bcd3-b6476cf91705@oss.qualcomm.com>
Date: Fri, 16 May 2025 18:35:15 +0200
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
        Rob Herring <robh@kernel.org>,
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
 <6274641a-7366-41cd-a0a7-a9e9cc41b8e6@oss.qualcomm.com>
 <0a73989f-b018-473c-872a-5cbc2e7d1783@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0a73989f-b018-473c-872a-5cbc2e7d1783@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Fi5YAS0CzVoUBs6C74yY9kZPNP3kZVQd
X-Authority-Analysis: v=2.4 cv=KulN2XWN c=1 sm=1 tr=0 ts=68276949 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VNoyoka1EbeTPVikYY0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE2MiBTYWx0ZWRfX1Vw8f0TDXlbx
 aWYwOEykPmTwmVsiz+IHqAiPz2/MY81TcsRqr8X4Y/nSTshkM+fQtYYElPPjr75WIcwxAcWNLgd
 aRxvT+QcUS5j0AFoKKKZOwiZwYSJY7La840GWm2e5xO1SSgVijuOqM2yk5WWBdsEVETXC95jA7m
 P0QdrcQOoWx/BJaP3CgzTSLvhZYLJ1fZqLVZ+9dgQ20Lpuy7w4o+a4mQ+5lPicAfho02yBbLkj4
 AnK/UaMlN+q5gUJa3xyM5QXjMT2yXzzZN50LXnpL4K1v4KeEOxP1MaCHy3ymu3v0ZrImP/Je3bE
 2Q9p7JEczzAe14XwpRL1oNjoqxvdT1CeJqyRicXZ+wqjMOeF4/gqzOLIzOo/DtLeSfXfC76/hEp
 7rHKxnG8uIpq0PfU30QWh4cY7UFkaGJKxpyThAcScqFa7Z1luEENLBaorxXOJldZeNvFhcuo
X-Proofpoint-GUID: Fi5YAS0CzVoUBs6C74yY9kZPNP3kZVQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160162

On 5/16/25 2:52 PM, Kathiravan Thirumoorthy wrote:
> 
> On 5/16/2025 4:48 PM, Konrad Dybcio wrote:
>> On 5/14/25 3:15 PM, Kathiravan Thirumoorthy wrote:
>>> On 5/6/2025 4:31 PM, Kathiravan Thirumoorthy wrote:
>>>> On 5/3/2025 3:53 AM, Konrad Dybcio wrote:
>>>>> On 5/2/25 6:28 PM, Kathiravan Thirumoorthy wrote:
>>>>>> On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>>>>>>>> +static int qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>>>>>>> +                    const struct qcom_wdt_match_data *data)
>>>>>>>> +{
>>>>>>>> +    struct regmap *imem;
>>>>>>>> +    unsigned int val;
>>>>>>>> +    int ret;
>>>>>>>> +
>>>>>>>> +    imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>>>>>>> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
>>>>>>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>>>>>>>
>>>>>>> That way all platform specifics will live in the DT, requiring no
>>>>>>> hardcode-y driver changes on similar platforms
>>>>>> Thanks. I thought about this API but it didn't strike that I can use the args to fetch and match the value.
>>>>>>
>>>>>> I need a suggestion here. There is a plan to extend this feature to other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT cause as well. For IPQ5424, all 3 cause will support and for other IPQ platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any case, can I define the DT entry like below
>>>>>>
>>>>>>           imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under value> <Overheat value>>;
>>>>>>
>>>>>> and store these in values args[1], args[2] and args[3] respectively and use it for manipulation? If any of the platform doesn't support all 3, I can update the bindings and define the number of args as required.
>>>>> Let's call the property qcom,restart-reason and only pass the register value
>>>>>
>>>>> Because we may have any number of crazy combinations of various restart
>>>>> reasons, we can go two paths:
>>>>>
>>>>> 1. promise really really really hard we won't be too crazy with the number
>>>>>      of possible values and put them in the driver
>>>>> 2. go all out on DT properties (such as `bootstatus-overheat`,
>>>>> `bootstatus-fanfault` etc.
>>>>
>>>> Thanks Konrad for the suggestions and the offline discussions.
>>>>
>>>> @Guenter, I need a suggestion here. Currently as part of this series, we are planning to expose WDIOF_CARDRESET, WDIOF_POWERUNDER, WDIOF_OVERHEAT reasons.
>>>>
>>>> Once this is done, we do have the custom reason codes like Kernel Panic, Secure Watchdog Bite, Bus error timeout, Bus error access and few many. Is it okay to expose these values also via the bootstatus sysFS by extending the current list of reasons? Since these are outside the scope of watchdog, need your thoughts on this.
>>>
>>> Konrad / Guenter,
>>>
>>> We had a further discussion on this internally. Outcome is, it wouldn't be ideal to hook the custom restart reason codes in watchdog framework, since there is no involvement of watchdog in such cases. Also I don't find any references to hook the custom values in watchdog's bootstatus.
>>>
>>> If this is fine, I'm planning to resend the series to handle only the non secure watchdog timeout case. In that case, as suggested by Konrad, everything will be handled in DT like below to avoid the device data.
>>>
>>> imem,phandle = <&phandle <imem_offset> <value>>;
>> the part before the comma is a vendor prefix, so that must be qcom,xyz
> 
> 
> Sure, will name it as qcom,imem-phandle. Hope this name is fine.

just qcom,imem is fine, phandle is a datatype described in dt-bindings

>> what are your plans for the other reboot reasons? are we scrapping them?
> 
> 
> No, we are not scrapping it. We are exploring further on where to put this. May be we can put those logic in some simple driver named as ipq-restart-reason.c under drivers/soc/qcom/?

I see drivers/power/reset/at91-reset.c does something like this

Konrad

