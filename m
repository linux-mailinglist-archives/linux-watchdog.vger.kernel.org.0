Return-Path: <linux-watchdog+bounces-3515-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7203ABA985
	for <lists+linux-watchdog@lfdr.de>; Sat, 17 May 2025 12:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 914E5189F361
	for <lists+linux-watchdog@lfdr.de>; Sat, 17 May 2025 10:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD64B1EF080;
	Sat, 17 May 2025 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHaW42R2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4491E32A2
	for <linux-watchdog@vger.kernel.org>; Sat, 17 May 2025 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747478480; cv=none; b=gXJBIvwzdipN/zKCEZJkZvdHNXnuikPuXS4iyUSmM1zjGu0hEmLt7x/qspw/7nD3ER5heObANJEDV74yC77IFElGoFD66cjAA+l7n4bA12Ou2lYzWEjgs5hblw2m0CzGTceFMqM6JEG7HEi7VarS5YerRA0jZD2Wlevf+fjtKvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747478480; c=relaxed/simple;
	bh=W/itcnvQpaaFxhLc5WAxPpHv+ElKddmKVPem0jY14NQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kwj/hwSMaXY/9bwDW7o5LgN0e4+w5/3vI+dvZALD+4o6O9n2bzWTmb/a0BC5ZKwWyCx5es0L8LF8k9Wp0K8n/rkAGs82w/1/8ojPdjpMMo27Ty/ABB2N24lfqf4E5C6CMGp4ZE+nDoTYdQisvbENc8pdYAKdZ6pVthW5MmRlbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHaW42R2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H9uIZu009895
	for <linux-watchdog@vger.kernel.org>; Sat, 17 May 2025 10:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUFFqXgv+iFx1ppzwIqGbfC/jJrMz8MlTBLmcydgW8E=; b=LHaW42R2EhPMP3L5
	mOPAQPr7kcCyltWqjvrk7oYkoLHcXTNogSV6llUwH8aL9vlxYP8dW2qFhaRBeDQC
	iv3j+PRyQZoh2rpiK3SRqTfFSuW5DpiS9Hy2M/cHf79aS8adV1hYxW5WBhShOWim
	9xtfgfLShfwan3lMnS79Ui+TD+nStdsOTxQhxTIx+VSkdruPHtsESoEhjQVIMm9A
	B1wpKqj8AzH/bneiUPkbPiUavC/FVItgFTi2qLQOOjP3X/0EyxZnGL2HTN+5714g
	V47EUiBVNGv0XmQvN4FRkktkzmCRTJ5CFL7pKqEGTwPsn7IfGqF6GezF91phyw1g
	8nXpXQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmerfmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sat, 17 May 2025 10:41:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e7f041997so51454875ad.3
        for <linux-watchdog@vger.kernel.org>; Sat, 17 May 2025 03:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747478476; x=1748083276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUFFqXgv+iFx1ppzwIqGbfC/jJrMz8MlTBLmcydgW8E=;
        b=QX7aTuKeQ42bnujzn/M/wn3+lrJcP1jYMijAMDzq2qF+Ij6pobUWmT3qTBOCkqMHQh
         0RtquwIe23AG/iqZlh1+N7i8nWKYAj1Zb4MYllVQ2cNXvJNhHBL6x1Nw0VtE9FXO4iWJ
         //aM5LlF2FliIgd3sJxWegNigyp3xObu1UMvmVdU/OEzZ3BAroFm23MSOE5ouHLubdNO
         ZdlIb16TZYh6ortG6fbVyfijAuYHxA0ExyK1JEF5mnyGV6snfI9VkG2Ws2yMCzsz0jlQ
         O1GsEY7uxzSKRRCU8Y+vZQJ8K1VMrWmZQtB4vsKF8obq1uPXtlUvjgikX/8EUhYMcqPA
         Wiiw==
X-Forwarded-Encrypted: i=1; AJvYcCXhop0xXejnIIeZ80CPgaWt55YnJQT2ZzdVihefsebNiNSA6fA1pWlsbnaKgBJTAtXKla7uowKIYjcCTGYWBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKNXmqNhbIYW5nhdtE9wfs2tQXiDzkCS+vqyVXxyX+8iKEkdFD
	z/jaMsQm0eSBS9u1mw24WZP3sqdkF4KZU6gyDdBvBvn4EZaRBiMXKTcY90ZVCwJt3v45LAXKtWS
	91Vl0PzvbpfSBTbWtJAJ1HNJCRKXqie3uS/dhV0WmRT2DwvTt4DrrbHmu8Zyil6X/LxEeCw==
X-Gm-Gg: ASbGnctkL+qQZvrvhXfDLNB9yjh58UumKiIOekN9r9TrrXfLCkiHbG31TOFDWlWwLgy
	p3zMdFTyOPwkqmf6/jPTP/g93fCNK2IGTnQYq0aCM7X1TxZTYopjeMnSi3Q97ipJWi0G26vA/yK
	QmA4LJHPz4m3T4EzJMwDAvXGg4PynwSqigFK02ZRuY3/gWahwO2OXq8cxR5163kUnLADsM8I/Ur
	nmGwvq5b09nfNLyD0mdOb62aXGKiayBZBdaaM/oBSQPojrHvr+r/Js+0Wc2piO0hppJ/2VKyh8q
	OiwTd8n4v08q+CKnKgho/unUjfGddT+mcZjRE6uyyd9NEmxioRHi
X-Received: by 2002:a17:902:cecd:b0:210:f706:dc4b with SMTP id d9443c01a7336-231d44e7c4emr88477345ad.13.1747478476358;
        Sat, 17 May 2025 03:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF03apz0TtzAK24dth+AnzgjgONUQeTXNUK8K3witaHAREvS0v0ocsPc21LJow2qL9dXx7t4A==
X-Received: by 2002:a17:902:cecd:b0:210:f706:dc4b with SMTP id d9443c01a7336-231d44e7c4emr88477085ad.13.1747478475908;
        Sat, 17 May 2025 03:41:15 -0700 (PDT)
Received: from [10.151.24.139] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e26d83c6sm24759895ad.47.2025.05.17.03.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 03:41:15 -0700 (PDT)
Message-ID: <4b931949-0254-42d0-8aed-987e6e0a0a79@oss.qualcomm.com>
Date: Sat, 17 May 2025 16:11:09 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <21bd89b9-9f6e-42d0-bcd3-b6476cf91705@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <21bd89b9-9f6e-42d0-bcd3-b6476cf91705@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=682867cd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VNoyoka1EbeTPVikYY0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 7I3u5y5RoWFkpsH0pS2v2lwIG5ZEdt0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDEwMyBTYWx0ZWRfX8/FQR1dxOZ6S
 aFkV17YeouhcexkWdU3E2BIFlF4MJGJYYL4/cvCmMaEKrpnwBww/XYyTpRh5MzEm5L3RcWn7yEC
 WPG14QvXoS5vS2BQ1WABYdLsmOYeziY3JfwVZSqTvFpT7F/KkczX2O34iAzhuZoM7loCANusVYE
 EM8jHTzvMwb2M85nwxoOslD9dBzw0L+DPs7Lz7JkF6tO0MRlteKnLH0GufpXR74VL6L11ScJ/qA
 /v8EijCaflad8gkY3telmTN0Fg+EVSe/6ITK18ItAVtr/G09JglpflVVPP978gjQIpWeTLu8zYF
 bIpc+zwdFB3qEL/Yq5g1a4nIvSUauwL5RwyXH+be0XoF71agaKPNYl6MLsm1J+sNJpDLRb9Uuoe
 DjGqjZkhPSzXF4H+6TxNT9HUTe3z1OY+nsNFrCMkWRybFSxRmEjkJaHyDBJwGleLAFvSUQO+
X-Proofpoint-GUID: 7I3u5y5RoWFkpsH0pS2v2lwIG5ZEdt0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170103


On 5/16/2025 10:05 PM, Konrad Dybcio wrote:
> On 5/16/25 2:52 PM, Kathiravan Thirumoorthy wrote:
>> On 5/16/2025 4:48 PM, Konrad Dybcio wrote:
>>> On 5/14/25 3:15 PM, Kathiravan Thirumoorthy wrote:
>>>> On 5/6/2025 4:31 PM, Kathiravan Thirumoorthy wrote:
>>>>> On 5/3/2025 3:53 AM, Konrad Dybcio wrote:
>>>>>> On 5/2/25 6:28 PM, Kathiravan Thirumoorthy wrote:
>>>>>>> On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>>>>>>>>> +static int qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>>>>>>>> +                    const struct qcom_wdt_match_data *data)
>>>>>>>>> +{
>>>>>>>>> +    struct regmap *imem;
>>>>>>>>> +    unsigned int val;
>>>>>>>>> +    int ret;
>>>>>>>>> +
>>>>>>>>> +    imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>>>>>>>> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
>>>>>>>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>>>>>>>>
>>>>>>>> That way all platform specifics will live in the DT, requiring no
>>>>>>>> hardcode-y driver changes on similar platforms
>>>>>>> Thanks. I thought about this API but it didn't strike that I can use the args to fetch and match the value.
>>>>>>>
>>>>>>> I need a suggestion here. There is a plan to extend this feature to other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT cause as well. For IPQ5424, all 3 cause will support and for other IPQ platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any case, can I define the DT entry like below
>>>>>>>
>>>>>>>            imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under value> <Overheat value>>;
>>>>>>>
>>>>>>> and store these in values args[1], args[2] and args[3] respectively and use it for manipulation? If any of the platform doesn't support all 3, I can update the bindings and define the number of args as required.
>>>>>> Let's call the property qcom,restart-reason and only pass the register value
>>>>>>
>>>>>> Because we may have any number of crazy combinations of various restart
>>>>>> reasons, we can go two paths:
>>>>>>
>>>>>> 1. promise really really really hard we won't be too crazy with the number
>>>>>>       of possible values and put them in the driver
>>>>>> 2. go all out on DT properties (such as `bootstatus-overheat`,
>>>>>> `bootstatus-fanfault` etc.
>>>>> Thanks Konrad for the suggestions and the offline discussions.
>>>>>
>>>>> @Guenter, I need a suggestion here. Currently as part of this series, we are planning to expose WDIOF_CARDRESET, WDIOF_POWERUNDER, WDIOF_OVERHEAT reasons.
>>>>>
>>>>> Once this is done, we do have the custom reason codes like Kernel Panic, Secure Watchdog Bite, Bus error timeout, Bus error access and few many. Is it okay to expose these values also via the bootstatus sysFS by extending the current list of reasons? Since these are outside the scope of watchdog, need your thoughts on this.
>>>> Konrad / Guenter,
>>>>
>>>> We had a further discussion on this internally. Outcome is, it wouldn't be ideal to hook the custom restart reason codes in watchdog framework, since there is no involvement of watchdog in such cases. Also I don't find any references to hook the custom values in watchdog's bootstatus.
>>>>
>>>> If this is fine, I'm planning to resend the series to handle only the non secure watchdog timeout case. In that case, as suggested by Konrad, everything will be handled in DT like below to avoid the device data.
>>>>
>>>> imem,phandle = <&phandle <imem_offset> <value>>;
>>> the part before the comma is a vendor prefix, so that must be qcom,xyz
>>
>> Sure, will name it as qcom,imem-phandle. Hope this name is fine.
> just qcom,imem is fine, phandle is a datatype described in dt-bindings


Sure thanks.


>
>>> what are your plans for the other reboot reasons? are we scrapping them?
>>
>> No, we are not scrapping it. We are exploring further on where to put this. May be we can put those logic in some simple driver named as ipq-restart-reason.c under drivers/soc/qcom/?
> I see drivers/power/reset/at91-reset.c does something like this


Thanks for the reference.  I will submit the patches in a couple of weeks.


>
> Konrad

