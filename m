Return-Path: <linux-watchdog+bounces-4731-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 510CBCDA300
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Dec 2025 18:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2DD93056C41
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Dec 2025 17:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463E53502B3;
	Tue, 23 Dec 2025 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUJ5AsyR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPrJcZAQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B743B3502A8
	for <linux-watchdog@vger.kernel.org>; Tue, 23 Dec 2025 17:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766512248; cv=none; b=Rw6Tt+KGuKkQqRbBRd6sDB/fbQyg4PBYtdP6BgCU3HGpraBDJ4ZGfGV4OkUay3zsmSjW9s2mgfuRIVQDFCuY1Yu2Cu1/7jxoC5/nufL6RYgYEvmqDRcIw3Jgzf3LFvXXYrt8I+gXgbkbseG9AaJmBOtT0NQWwWziRSFaaaGxel4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766512248; c=relaxed/simple;
	bh=+i1eSTNPXxwZP78zP0rQuPGn4sg8Tqe01LGVbkayK7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umoqu6p+FQS8QoZp4tCuxdmkP/G1FUH4i2Jczqzv3a9+S5ULLuPJMuiIFgGjezodoYLaKUuTKpMfbctGLOd0obFBCHtAEgmGXID8ls0XgfO/vy3Bn+VcEUyNm88bzcM2JPU3y311FAhiKRVhUQOSdG6TxMcktE9MLIvuWYLiA3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUJ5AsyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPrJcZAQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBR8cX700441
	for <linux-watchdog@vger.kernel.org>; Tue, 23 Dec 2025 17:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9pZ5bVgW9NnLKyCv/+M1ErsUPVvJdj0vF0fVveYMCg=; b=FUJ5AsyRjEzzCQL2
	0y8A3MeDZzt1nBcFUY/eQ+vIbUYJreKlHUlN0w1hdnOrUrwoy5+/49S+MsvdGa4s
	iKLAECuRnRVfWfncI4B/k17iyU+qgnFwnbAli+UcJebZzNO/ZChwawEH4yVUDYn7
	jQWYQ8Tze8DxqdxqpqnpQsKZF69RHWeEYbJBmvJLWzBxpKsvhA6RZo3RTGuypiRU
	/yiDTBbFXXl9miwkl/f2vex3zLENGV8IZ0NppJBf/YO9alQXTdNSnErh8akjv+MT
	M655ugv3p9ZGxAH6dQOVK2tI90qzpyCxLjdcqvtPgWqucp3ed3wm6SUgetl+OhrZ
	6bMUCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7js3ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 23 Dec 2025 17:50:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9f3eaae4bso172692985a.3
        for <linux-watchdog@vger.kernel.org>; Tue, 23 Dec 2025 09:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766512245; x=1767117045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9pZ5bVgW9NnLKyCv/+M1ErsUPVvJdj0vF0fVveYMCg=;
        b=kPrJcZAQT9QgIzf5jTWeIDdEF7KatZZ2lVE19ZxUzRShla8y+bhUfshwwWgUedUBzF
         mzf2Sbh6ugpQaEOfX++yP/LH9dWkUjMkuMdgJMWaVbVWKFDNoxDzRSr/te8YQh2B5t+1
         vH8uKqFw8VanmNVJZDHahqLkREgEYTpJyr10Oqj6mjKmvKqNll+aZP1hWBFOBuyb00B8
         aVgMPVir6YzESTEB79CjmGDcGfHvfGABPwbUj8UDJ/AeksSPDPTZ2hveUfWHRRHALWsM
         T0yIzEGgZQsg08USEtXwgNgGAcAAcEhxvFwQaNYGw3Q/9t2a0geaeZqC1mgZASEukjmP
         VHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766512245; x=1767117045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9pZ5bVgW9NnLKyCv/+M1ErsUPVvJdj0vF0fVveYMCg=;
        b=OwMuCUaxnhv46q9GSrFQtQkMSBkzKeMn8Y9BbGBBeFdUbtEP+mlJKh3bVtajDuwFvT
         EgN1OVKaugopcfx8myfIBwn9JSc60Bwd8gARpaeByizaPZed77/jpdm13PbHK8zqmqYE
         s5gtDV7wMLsia0Z80UXk1qWS+qmx1YSmYWaiqjM0SM+Lf4By5UwphE4gIMLx3K4PqXcR
         jVdiLc+QIg4lKBJlDzQ7JmkjD1O9ie+2l4TdMe6cG8Pa9/hgyvkgyYNO1WZqV3DjCcq5
         VXwcwcDmw7l88lb5hXFhqbwoBprhZHObmLdknSTys/2Djhi9I/uMbQs2onsWkXRnvoh4
         tWXg==
X-Forwarded-Encrypted: i=1; AJvYcCWLPcX59t/CYn8mBOdhyjeiPW4JPA0Rlz8MZflwBEwYrZY39gw/6m7pJNDrEL+52EQcmKa+me7lyOLAFJoCIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1eWrpFaoCFHJdw3R2GboRYurHKx7nP3lmWMuOEAxO5jjbu3pY
	S2vUqWzj01U1Hf0uSvsKtyRvAcuQr3UfWP/n6xnGfheK9aiP/mgQqRq8yifN5LjePwE2X9Nhczd
	i/lP06m58f4DcRp90gNIZhDroMmXEC3MlG2KZyIc1z1mFZmPdPXiYyjj7Usqe7vXEofLG2g==
X-Gm-Gg: AY/fxX4lNNHWjni+TNABSGcic1rW/lGU5w/WBEExlgOH1A7p4VJd5NwAg8L26Cl7GdN
	1vWI/zX7vN5CM3uOrQUMOxHTWaMK+/lujwB2DYLtckidaoWgIz7SQ9l0SIBuusqqWp6i5jsaAZ6
	pb8FAcCe8xq4VFGHG+ohXCAGExsdycJjTpngPWDEM20X1oOPBC5ud42Zj1vHTY28bvduRBxx4FW
	8VSjexJFD4Xub2SIs+lkCA5ZibxYumhNYee2kdARgWJg5AFpaHKnHJ5k//EqQRJAxQlZFYPHhB8
	ZDSXm3cIJn03syMLaU13pqmkYsmlLhKtbYDct0NKf7acM20tR+NQUsDRoi/3XnVW1RLeXI8KJk6
	ZzMGYjR7+McYCrk895KTYgi1ShcAeVbxXFCNrjKBcjHmxR9Z5Mn2u35DP3i6U5K/l3g==
X-Received: by 2002:a05:622a:28c:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f4d620461emr58618661cf.5.1766512244900;
        Tue, 23 Dec 2025 09:50:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDX9i69BREA4fOTN99IvyB2FPzNt41gSCZwxWyw8lmenWkzgMrdDFfbDhuqvOiuctcG/zSfw==
X-Received: by 2002:a05:622a:28c:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f4d620461emr58618331cf.5.1766512244398;
        Tue, 23 Dec 2025 09:50:44 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90414649sm14350874a12.0.2025.12.23.09.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:50:43 -0800 (PST)
Message-ID: <e469548a-8d74-4d3b-9617-2b06f36013e2@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:50:41 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
To: Alexander Koskovich <AKoskovich@pm.me>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        hrishabh.rajput@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0OCBTYWx0ZWRfX7Qwy/+z4AK+/
 yRn5hxqSn5OL9UcTnnbY73azPd0Ekwt6wG9KrxbM0lP38XmS1SotDQccKgNFtHhimInwDPOk/ms
 F4JnGuZoUoJJDwIkKkLsI3HOt6uH/Qko4+UxK2FFZVL5Bcpyw8TYMGCTvWtv47yTKbUO0Mz/DRv
 8vxcAEWA1M6w3uIa9tYAbK5Mc1JQqkyd/n19NFp5N+/AtSR42Lhr2V6ow6dSpLPLlJEUt0DcJFh
 4LCW/90BXCg+2sgsE+GGPtrkQna3nnG7+TVu02tqfEbHjMq64bPhBEQd90CenTGLINBKoZSsldL
 HC3Yg26ZCqTReanN7uuvUG18++rirZl6jbZSXPLagpdyE8L+B62SwaowUsROH+8cMe7j9T+ksem
 nJCcgG4FM6sKdoQq5Yu07X4jX9IweR3WbhBwmdJ+P6h4RN/ePAIUuf4Y8PNaGMNN2/LZ2b4FZyf
 ioNo8o/3ynP+TWNB+Og==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694ad675 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=lsCYmBuC6W_TzA65AAgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: LSsqDKLdH22JFtkEh7C_I3CQWctbVW_W
X-Proofpoint-ORIG-GUID: LSsqDKLdH22JFtkEh7C_I3CQWctbVW_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230148

On 12/22/25 8:02 PM, Alexander Koskovich wrote:
> 
> On 9/4/25 1:05 PM, Pavan Kondeti wrote:
>> Thanks for asking this question. I believe the overlay part needs some
>> discussion here.
>>
>> I have tried this series on 8550 MTP. The overlay failed, so watchdog
>> device did not probe. same is the case with 8750 too. It works only
>> after applying this patch. I will test and report my observation on 8650
>> later.
> 
> Hi Pavan, was linked this thread after seeing what I think to be the 
> same issue on another platform,
> but issue is a bit more serious here since bootloader fails to find a 
> DTB at all, not just overlay fails.
> When the "arch_timer" label is missing from the base DTB on Milos, 
> ufdt_apply_overlay in bootloader
> will fail and it looks like the DTB memory gets corrupted. If you are 
> booting without a dtbo image,
> then you don't see the issue. Couple logs from bootloader when it happens:
> 
>      ApplyOverlay: ufdt apply overlay failed

FWIW this comes from ABL, which is open source

https://git.codelinaro.org/clo/la/abl/tianocore/edk2/

You can probably deduce the correct tag from the boot logs

Konrad

