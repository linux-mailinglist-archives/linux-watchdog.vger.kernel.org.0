Return-Path: <linux-watchdog+bounces-3426-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A25DAA7C23
	for <lists+linux-watchdog@lfdr.de>; Sat,  3 May 2025 00:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94CAB7A3B87
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 22:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC0E21770B;
	Fri,  2 May 2025 22:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5ypLJeY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716B0215F6C
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 22:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746224644; cv=none; b=K3aaeARbq4yKJoZwvtxgpSKRwhkbXU55C97xHHb+iBPsfHRuc/gxTwIr2+gf6MSqNFM6xNOyYplXp4Gd/IY4RWQD+v2b/a0qaODiVqMRJ9xNfn0cGUwyiZ1oQhRsa3TQ5l4LHWJ1PgIg3+fpZEYBD84HwgkQqRb7mRzSXkF97XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746224644; c=relaxed/simple;
	bh=9oGtb8LG/zJ9IV5aGAUTJtLHWlo3X+qYmkiwfn7P33Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exQ5kuO42etXT1WeDvJEIiAErX6OnDTu0n7xN+a6kV6/5n0jkPUHFXdEgcDtKW5rnecrgJsFuqox6+EYPb/0RxUlsnOLfWjSU/4XGwrwuZfYVrPcv4rdQ1wmWLeZXtiwKDvw/RZbavLIAR2+qGM9+iSGMc8NqmL0btWEu83yXvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5ypLJeY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KBaKn000894
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 22:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	afxPROt7hH4766j71KaFflbvebcQVU71m/JE3EEC4iQ=; b=E5ypLJeY0KPHUK3l
	wNzEQM0UMh4H6y4Qfno8fU0TNHA1kq3hSa4LRRsoBgTNouorGCngKo2n2hM9IdD/
	6TXGi7udHG64q63vMAi5g5uaiWF1OX+imOervaN1SKgtWpQmZax4rJ+HJcy/jQhp
	Z8n9KmABCoPucq/uPSNiXemIqKxF8F5dl+Lh7IHCZ6rFzyUeXBrvMSMrdpqV7nxd
	ij/Rq5bAGeunYEO8ZOuv9beA0Zi+c8HJCpsM3TuR4qlbSkOf261qlAC7mXGSAAEK
	gx36j65LARWuovp7Wbh1XEfEP1+2cWf0zFakXnZtQzFNXNhAZ6BU8hbpMOh61wJT
	xDZTng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2hjuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 22:24:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47ae9ed8511so6484301cf.3
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 15:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746224640; x=1746829440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afxPROt7hH4766j71KaFflbvebcQVU71m/JE3EEC4iQ=;
        b=F5Qtw57qp3/EeYULygDYaU0v2F5grCYri+tiCCCk3prPBenbOdGFhuCfAOv3YxWNXc
         FKYXAVjtXQkdr0VZ2snN2XETkCBm96K5wovEu3glZHVsfZ+yBNw9avP5UAfgGTGcwHhY
         zfEj5su0aXJXJAujIsMMz7wEEJ9SxGJBssKuP3cKb6Voc86dG50yQ76gfQMaBqKyzWAs
         AuC05Sway2N0RCDukIbIJZKQrwXxyzLk4V+G93/HktTYy3+rJDEHnY6aNcDsLvNRDn+Z
         7rMFczImxDH5hn/Xv+9VWhs5JiJDly7OvdEY9iVVPKygdeKexulb5q7GGnf4iSAcZ6bN
         SEZA==
X-Forwarded-Encrypted: i=1; AJvYcCWQI0e7cuYXQD816ccgfAmBgJjqHTzNqyYVeXwpgRMEoP8u/pkPgX741RsYuNEcFCM/Ugc/plt2rVC2CqX7pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2cSYfo1kmrJvRpYhNXUprAKnpx8PG9HZyGmUvsFFHLAzg5RNN
	pAet7SoCwgEbE+bB6JqbVOYURRhinKTofEwDDB86KqQoJgWLmwkR905rIbNUntQTEskSjl6rg7S
	EbpVPgKihE53aCjm4O/6Z75jP9h29sZUvBn3+Le8vu7gAwo9+O95gwCZhKsEQyzNxog==
X-Gm-Gg: ASbGncsaBD3yCXivgUqe3u50cbbt7l76Ty62ZKkzve+e/M04HNFhImmHf4TYIHtiGnX
	OMa6q96MhjFvUAgLi+kOOJgIGY4x7oylpgiKsRjymFbBaHaBIZSq4kCuTwmTI2bP92//KUTs2Aj
	IjzTTffR6eXq3XDiBa4+tw5oJs8AHnQFDIiPaLPwNvmrvFjnij+D7y6Se2iXI2lfzpzPo5SVhCn
	YIWKRhoWJbIP66d1ff+fy/H86aCJaD34hQqJHec70hEaIf+KlkrK4mrd21/xoHIq5j+zWHb5Jkp
	7fSe9qKjKbnzI3eDInwHPPURqPKIxaO16rqZcJJ+wblW0jcZDFRYG1DYDfZFUf4qsxY=
X-Received: by 2002:ac8:5810:0:b0:471:f437:2973 with SMTP id d75a77b69052e-48c32ebe60amr25411831cf.14.1746224640358;
        Fri, 02 May 2025 15:24:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXPCWKDkOFuSWQ3PbjHn9q2h9mjOhaANWaWDVj+vNMTlyz3oHQMt9ul4xUB3d6PJd+9q7Mzg==
X-Received: by 2002:ac8:5810:0:b0:471:f437:2973 with SMTP id d75a77b69052e-48c32ebe60amr25411631cf.14.1746224639955;
        Fri, 02 May 2025 15:23:59 -0700 (PDT)
Received: from [192.168.65.170] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3c53sm108782766b.56.2025.05.02.15.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 15:23:59 -0700 (PDT)
Message-ID: <8a763c70-adcf-4a14-bb68-72ddc61fa045@oss.qualcomm.com>
Date: Sat, 3 May 2025 00:23:56 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68d280db-f7df-48c8-821d-f7d408c302ad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3g4v9xGS7G-MgeSMH6BexNXYFks6fFW2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4MyBTYWx0ZWRfX0kpwIEGA5PJO UP/r5m19D63A5+zbZp2yJaRRWLoNFOhh8A5dMtjFyRaxExdYU8/bjmsBz5FmDc39D9soOglRseS ukIoqWg22dQiXVT23mtf6OM4UHBNX8UKZTEI6wxsZL+RE87USyulyroDYERrpDQaS+Sf4tH8imF
 AV7iQfVLtIJQYAO6RnOfzdY61X3ZvvTXATFOJqT7HkNFAlF9saplyPGmMPkcGZMByXUrikTuwTh kG6Sigy0KHTPK0GrgjeH7GMSb261hP7UtSBg6Wf3oY4b40sQ9WDiNvXkAaWxFLg7z/Uh7SXEoTZ xDGp8tZhbV3vf5WDaMVtM4/v96fMEBvt3R8TlSzZ2rRRQgYkGqjGkuJcJhQHgqCb7Lecz1XJKqt
 nwfMx2gsHIXYIQv5jekt3NMC8HaGwFjFYUat54oUTegFlPLlaaCts0FPKPoMxqFXl2WX0mxI
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=68154601 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=n-kv2Co_dslhl88RD3IA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3g4v9xGS7G-MgeSMH6BexNXYFks6fFW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020183

On 5/2/25 6:28 PM, Kathiravan Thirumoorthy wrote:
> 
> On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>> +                    const struct qcom_wdt_match_data *data)
>>> +{
>>> +    struct regmap *imem;
>>> +    unsigned int val;
>>> +    int ret;
>>> +
>>> +    imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>>
>> That way all platform specifics will live in the DT, requiring no
>> hardcode-y driver changes on similar platforms
> 
> 
> Thanks. I thought about this API but it didn't strike that I can use the args to fetch and match the value.
> 
> I need a suggestion here. There is a plan to extend this feature to other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT cause as well. For IPQ5424, all 3 cause will support and for other IPQ platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any case, can I define the DT entry like below
> 
>         imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under value> <Overheat value>>;
> 
> and store these in values args[1], args[2] and args[3] respectively and use it for manipulation? If any of the platform doesn't support all 3, I can update the bindings and define the number of args as required.
Let's call the property qcom,restart-reason and only pass the register value

Because we may have any number of crazy combinations of various restart
reasons, we can go two paths:

1. promise really really really hard we won't be too crazy with the number
   of possible values and put them in the driver
2. go all out on DT properties (such as `bootstatus-overheat`,
`bootstatus-fanfault` etc.

I'd much prefer to go with 1 really.. If we used nvmem, we could have a map
of cell names to restart reasons, but we've already established IMEM is
volatile and we shouldn't mess up the convention just because that
subsystem has nicer APIs..

Unless we rename the subsystem to `fuses`, `magic-values` or something..
+Srini? :P

Konrad

