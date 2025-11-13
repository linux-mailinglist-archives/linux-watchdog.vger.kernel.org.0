Return-Path: <linux-watchdog+bounces-4574-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED40C56D72
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Nov 2025 11:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 671814E63CB
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Nov 2025 10:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9932E6CA4;
	Thu, 13 Nov 2025 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecQb3Uzi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSUR2Ytl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A332E5D32
	for <linux-watchdog@vger.kernel.org>; Thu, 13 Nov 2025 10:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763029498; cv=none; b=FEacvZb2FmG+aqJv+o5FzbvAPc3ENT8hJmUc0N58zjKg30D72XJCUOloayraQQOgRirxrlBHfcOwDD4KT6uJzUiGTMH5jfq8r15esOTVK6ga3NDsX1d36vwM/8btZ952a4sQl7nj7PfYQ5s4iDIhqC9rsk+p/nRT4fQtByrBgbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763029498; c=relaxed/simple;
	bh=y3Tkh9Y+00TkC16p9tWZ5iuCujnyRKQ+Q9BWXTtfT5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmkolJ3WpmLzO8L7tsrgr1z5wUTjzP1l1Wt3lyVkXRsF/im2Hi8OmovGsdvo98mSShXvPYDaFSTjT0Yt5pCO1nPipAKfN4DtNNC2+9VXNNJTSKO37eY4wJYRoOmvp4Wb5W165/iV4stgvdETa19TcjqaoM99CXgpvJdWlzg0Ek8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecQb3Uzi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSUR2Ytl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD4weSh3336823
	for <linux-watchdog@vger.kernel.org>; Thu, 13 Nov 2025 10:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OSax5t+kt4/xPcqkn+xgV2a9SEJt/pjMe89M6iO6pc=; b=ecQb3Uzis5TIo0Ts
	XCz2YVy9BUgoVj/4GJA/ubtmiHO3b8najejQq63DxFQUV5+Ptw5KIbaIU7EQEQiA
	7D6XjULPe4iKYvdGI+pPVDVsO54lGGBs81dT6QLxU+u/nsuWF+l52D1Ad6V/b6XG
	3PbEbJe5lQ75vO9S+hJ2T6Um/XQ+UIgUxLE8UCRbAj644t2g1liudtjgyxsZakTR
	tvLT95iQbv261QIYs5OCiTOGtPcV8tXWVrlYC8RsWiL8VQYTD3g3fTZRnOchyxj3
	vKHYZ6Jlbx/l8qISJuI81UpqhM2B0MG1+IL5UmsGehldaRZBWqBb9jptAJGl7a22
	7p4xdg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad8sa10wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 13 Nov 2025 10:24:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aa9f595688so1160482b3a.2
        for <linux-watchdog@vger.kernel.org>; Thu, 13 Nov 2025 02:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763029494; x=1763634294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OSax5t+kt4/xPcqkn+xgV2a9SEJt/pjMe89M6iO6pc=;
        b=DSUR2YtlaIUCuslAqoKzLWxESW+5g6EiPY1eKjOY/PDJPe+A4gMWwyNYjLUJG5XzEe
         oVgmtiopLsLGDXVahb0yqIctJ//Um3G/nn++DDMoLtGvmWvAuZZqzN7bw2O3DVLX2l8Q
         cMVcp/kPrQj9e4AN7FWNrfJwHv/AOleOn8ReV+P5DiiQINrqxskMSosK6+9mCbURO6OI
         jHDZW6eyHAEcjMK1/XEX4kcuwiDEcvn2pWcKtvAksVJEg6szXqceUGu8tTFMG13KdXnO
         ZzcXthI7PRRaEBjoXlw4GphmutJYVFCRqYlHO8h/5l+y2mqLJvK0qOYXFeh15B4mprP8
         e4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763029494; x=1763634294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OSax5t+kt4/xPcqkn+xgV2a9SEJt/pjMe89M6iO6pc=;
        b=ksDLxde1S6zzdnbNmfMfg+1xweUnaHo/Az1oP6rEyJo3cMiVTTyKt54536bZYqCEMd
         3eHe1jhT9JPCELO/K6EJVpeuzjYO6xOb4Pm2PPWJV2L9tFujyD8eX9wZE9Xyz5A2mHv8
         9rfP5wheZXRhZjI4Gz64Sl9uTtkssjNUmaySWYIS1ZiEJQOL+wd9d6Xpyfjg8aHcUUff
         ru5E2pZTWlTZBszZHYLGsYzoQXxWYvB/XpbmAxxyP6fGOnR36c7DuTmldcIP4Kcl3axr
         YJGR3w9ocLaawtrLYIYbYl5UNQe9HJZjGgvPIZbJfmUSv8UXaEsVxZL/xym+yDKOsOnZ
         GhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVubMUSJGKmToEu3w9ZPz7AHxMrH1lEc20gWKaJxlqsfmqDnzdt2cakQIrD6HjvmP1J2Q5qCbF7RiBN6JFFsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpnSrKKo5t3v9uDuybEHozlA9NOl/iM98QwjnqJvxsnwiLqE4H
	OwgMcepajLxkvf1zxJengLhjW/T37EcmnAuN5kI5XPPlhm92Ue1LIJa/KKwj5+zdsfIB9q2p+3m
	T+bQ8BRfKa+NB27jwCPeKMe0Zxlv4cvETtJ133djdkGOisnalJuo5WNnuheVDCYXuqusIEA==
X-Gm-Gg: ASbGncvlTcK6/x0QX2nT3MywfGDbXRRgHtkAQbk4S4aew+qH/kt/e2dXvGAd2VY/IsW
	YeeN++uL/1S8dw/X50JkMfT+z8mihltq1JlpXpgpxEUdv5FMKmDqkfa//PZS54P/GNaT7E634YE
	gkh3n/YXdtq1hbQTnsBE9ZjCl+H7WJxbG1eNT+nGBAqDemsxG+HbyIcmqSkDnwoc/ddpRwB4KTd
	YiAfEZTmvRDkB58gEus7DfFuJH9/nadHa+1QSC3y3U/cXFzUQhJsybAHOmrB4X4txsRB1QWUdGl
	Nww+cFPF9wRZBs66xhrRhLvD522654fh3Rba4301xPiw0Mhd6/KAez11Wy754ABp7o2DYADJv12
	up7C4LQDqJMLrz8TbIlnC70QL5hehjPqFmgmxmp0yW3M665binH7yx7lgrSXRu63vuD+kE0OZjB
	zVLFWauJ1FYFbKipYdnQtI3Q==
X-Received: by 2002:a05:6a00:3ccd:b0:781:2538:bf95 with SMTP id d2e1a72fcca58-7b7a299aeb1mr7083456b3a.10.1763029493646;
        Thu, 13 Nov 2025 02:24:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnWkPH7h7QZCCvr43VCijhRBypZyvpSZr65Qfwwqa4vfN5Jq0617Vyobk+VmSzuOSZTLg90w==
X-Received: by 2002:a05:6a00:3ccd:b0:781:2538:bf95 with SMTP id d2e1a72fcca58-7b7a299aeb1mr7083430b3a.10.1763029493115;
        Thu, 13 Nov 2025 02:24:53 -0800 (PST)
Received: from [10.190.211.199] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927826dc9sm1812902b3a.53.2025.11.13.02.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 02:24:52 -0800 (PST)
Message-ID: <0df6882b-5ac7-48d4-abf6-470921fea81f@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 15:54:47 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20251112-gunyah_watchdog-v6-0-38ad01f8dac0@oss.qualcomm.com>
 <20251112-gunyah_watchdog-v6-1-38ad01f8dac0@oss.qualcomm.com>
 <e5awatsfe6qksjj3z2vqn4fpc6pnlzuezu544f4oiyduappihp@zxgvyvyro76a>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <e5awatsfe6qksjj3z2vqn4fpc6pnlzuezu544f4oiyduappihp@zxgvyvyro76a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QUj1EBg3RvLwIa79922zd5WB7eNxRxm4
X-Proofpoint-ORIG-GUID: QUj1EBg3RvLwIa79922zd5WB7eNxRxm4
X-Authority-Analysis: v=2.4 cv=dcGNHHXe c=1 sm=1 tr=0 ts=6915b1f6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rIQdjpfwJTbE9Fzp_MwA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3NiBTYWx0ZWRfX/GkpQuLyQlJ7
 ACfDyQ/VVfpLVY/pDOUevYFeOBeUTWR8qMkSMJxstX29n/5Zf87msYKYeEsUVqDeQOehT5kbXnx
 +yCwY/UsL+9vBhr8sxO0vaHQeMtZ8YnxKLeeean+QwvExGhfi2zfMW3K9NZaMmV0kitQops+nE+
 sOGp5NsDtPTq/qYfkVP7U4ls/6b24s7mJA4UIzkHmhKkaijAKEArxhFzmtfrYVZnq6G+9H4eUsY
 GvnPErzFjP1g4act9mU8lQRr4O73YaK7i7xhetXg97x1/o6ArFkhUL8nVANKaItonQIaC/Us7aL
 dDFTNsakTdpdqqlp+N39f6nkFDTSyvhCkv6EYuSWHs6WwhXnwfNupJ5lufJI3+3EBakbFrvChia
 Hda9vgomXRj7nXlkJr0ueFnla7l3Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130076



On 11/13/2025 1:32 AM, Dmitry Baryshkov wrote:
> On Wed, Nov 12, 2025 at 07:35:20PM +0000, Hrishabh Rajput wrote:
>> To restrict Gunyah watchdog initialization to Qualcomm platforms running
>> under the Gunyah Hypervisor, register the watchdog device in the QCOM
>> SCM driver.
>>
>> When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
>> expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
>> the devicetree. First, we make sure we're running under the Gunyah
>> Hypervisor. Then we move to check if any of the above mentioned
>> watchdog device nodes are present, if not then we proceed to register
>> the SMC-based Gunyah watchdog device.
>>
>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>> ---
>>   drivers/firmware/qcom/qcom_scm.c | 53 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index e777b7cb9b12..3f45cc69ef83 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -2182,6 +2182,56 @@ int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
>>   }
>>   EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
>>   
>> +static void qcom_scm_gunyah_wdt_free(void *data)
>> +{
>> +	struct platform_device *gunyah_wdt_dev = data;
>> +
>> +	platform_device_unregister(gunyah_wdt_dev);
>> +}
>> +
>> +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
>> +{
>> +	struct platform_device *gunyah_wdt_dev;
>> +	struct device_node *np;
>> +	bool of_wdt_available;
>> +	int i;
>> +	const uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb,
> 
> static const
> 
>> +					     0x92, 0x65, 0xce, 0x36,
>> +					     0x67, 0x3d, 0x5f, 0x14);
>> +	const char * const of_wdt_compatible[] = {
> 
> static const

Thanks. I will make both of these arrays `static const` in the next 
patch version. Have taken a note of this so I do this moving forward.

Thanks,
Hrishabh
> 
>> +		"qcom,kpss-wdt",
>> +		"arm,sbsa-gwdt",
>> +	};
>> +
> 


