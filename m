Return-Path: <linux-watchdog+bounces-3545-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE42ABDFCD
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 18:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 023C3167531
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 16:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615E8259C9A;
	Tue, 20 May 2025 16:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4ggdOot"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18324C068
	for <linux-watchdog@vger.kernel.org>; Tue, 20 May 2025 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756859; cv=none; b=OD0bmSmpY53c++YeJKi0Sf+g38vOtC9/2uP7v1faTrdR+M3uGK9dxge27x5X7SNdCWxizwdZTSaNRlvR69tBUd8A/huOP8b5wJudlP+WEMo1QK6iRYr0t5NVzmKTrCzseHTT1mP53rhJL9vLvOhfKA1O/WUgo6jcpU1PdrZEy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756859; c=relaxed/simple;
	bh=XShGFTgNmrvDCJE12WoFrXmQEnD7TePscFZvl3S0xEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGyWPlpu6E36pWggSuh7QgAMEAtgpGZv8DMpwr6su8GSWFvd9G99AeHG/+IfnALgUaaK234hU7cacDsmVBcLOkeWSfVWTai2N7fX+SC+ka4G9zpbR5CBcejjOn6dOsh6yhGfyAwO4Yt+Lma3BoRuw8gMvAfxbo3zjD9pXk4K8mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4ggdOot; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7ZRdt012177
	for <linux-watchdog@vger.kernel.org>; Tue, 20 May 2025 16:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMB/4NFBbPr7e4v0JqDh+lXqkZdCYFJ/eYQU5wDTN68=; b=o4ggdOotUb3sY02R
	1ogiP6sF3rrUcmgrtkBPdV9Ix3pyfkmh9en6HT0RlojQsjou+94YUrfuN1TUv3PL
	5V7t08jGnFidPgJwdpw5hk4/b8AcP5QaByBhqgWCkolxFVMnrm/Ub9F1+FWxT126
	U1ZAMQ2EUnuCC77uPvwwhFzfyNusvRhErZ4IJ/0bvySslaS82tqmhk4ptXXwJpqG
	3v+y8DZVKTFLOEyv0WtRCq/JNF23+Shft4pxbxSGlPqOdvTJ6Ft1+zHqQtpiGGdA
	JT5SwIQ57/eZfXj6L088CzmoeQijxnGE45jdayhW92hcrV+0fXuw+2Ie9ZL5pZqz
	3/PBTA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rbt22qx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 20 May 2025 16:00:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f89a2df0deso16871736d6.0
        for <linux-watchdog@vger.kernel.org>; Tue, 20 May 2025 09:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756855; x=1748361655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMB/4NFBbPr7e4v0JqDh+lXqkZdCYFJ/eYQU5wDTN68=;
        b=GplMXDgRpAEC0z9tIjo94XTRR3TVbiC08GNutNW6uhW2x4OoXkRFkkW8DV63KmiGJP
         OUnbAnUG0TEbFPIJFQScOeFIazZipCw/NwYwQg3HDHUN4i2F+E+uLwTvhfHrMZa+FPaM
         I4MTDnsYauq1EV2HR97focPw4n4EEjxl9cvawJtkKyfW8C1EZpzQaezd+m+CbQonZVdq
         kIxeeOtVMF2aYINf5edJ5ig2gv19inigpwE63vVwPRex1kh2JN6aKauhSstG0qvVv1DA
         Y2snsujm9V4K/zKpnkEv1nCFV5wr5jwy/XHGBRF13YJdS1pTWO2x1rNrjjHJjIxCOY43
         vJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWA52Yjo+4A5oquiScS9E7aRwGjEEomSC9nG6kcL3zaZCmutM6bsJ7LaYX8nBTQgQi+Bc+u/pv7A2o3+dY8pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJEp6X2zSN/lMteAm4FJB7N9oTSvuktuO4xpYBwuezAcsSwu2w
	pUyazOOXqnky0jBcFn9dCa7ZFhQ3NH+f8khd4qbowt1zmigcSadlujwI4z+kcdVEI7UI0tkP6gD
	1OKwIWX6WH3FIyAA/Oxvm+cca0v7Cz5y7e6bbpkXTae/flTeEPU9YrgNobvZ0HnbLkfWNRw==
X-Gm-Gg: ASbGncu8bxR3dNNRIqzKcx06UJ9EeLQGPqQQWgejkHEBx/TkVq3eOhThnruHNSUYv7Q
	CxrcSAFK+1iMg9Hp5J5aLEguaDuUKSG7K8oZWl6cewnyWeQhBPgc9st5nRMKTDdph5NSyUbLItr
	L4lANd2dl68eMNZWxzWTdqFyi+utGzK+0KeXYHBq6zdVsrF6m974cjK7crzmu3g8BBftd95baE2
	zndAsZvFVxl2lIMy2Yx/aBMBzm3TuFc+9Xj498gG/tiDN5GcoOTkzOAdKoNCiEWnZL21/nOJtNT
	3qU6W02lMFXFueMsVp3AH7WZAnOyoeb6VDgb5OqiFYMSwFLIaGmuBZq7QaHjVMEIlg==
X-Received: by 2002:a05:6214:20ab:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f8b08282d4mr98336166d6.2.1747756855213;
        Tue, 20 May 2025 09:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUfgy1w4r+nTJ4LSFmejma8AcEDkG3KohHEdj355IJKL4b9rH4agpxCV3msGdiryUvKcnbXQ==
X-Received: by 2002:a05:6214:20ab:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f8b08282d4mr98335706d6.2.1747756854525;
        Tue, 20 May 2025 09:00:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438c1bsm756346466b.95.2025.05.20.09.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:00:53 -0700 (PDT)
Message-ID: <37bd619d-242e-4488-8d45-c2c85612bee9@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:00:49 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document
 qcom,imem property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
 <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>
 <20250520-portable-anteater-of-respect-c7be5c@kuoka>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520-portable-anteater-of-respect-c7be5c@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMSBTYWx0ZWRfXzJLGhfnxNMAU
 Sa/MGQeihkxUkdrToiDIeNuRxgalDXCJHeuHkoNzGG/rhR7j16J1AZCK4yMSyuxY6MgdkjU6Uv1
 +p9GFUMWr7CUqHwFANS7CLEPX1qmyDWIvGuE/Bk0qJYlUdZyhbBAEg3BF5XTvg/KcoyOOT9AEWF
 6931axqYnT5lafcG3Has69wblAB39BoSe5OEqyCoxri4F3xgYl4W5S5ezlZGy09M2mwzaxNGfQU
 yKcGxJM1VOMXYXhDNsGKui4qUaA6ie34ZhDKw8tKNyYoeLedbE98wkaps/BSWWBbauTp4MuXwxA
 BTnoc90sGEHSTA5vL4Yp0iY2PIT8KrRKoaAeJpmir2VyuCBJRnzYxkkSbvUuUD+jXpGLaPKFmJK
 xHf/ZYA0g7LmMnYPhV5mmnTLUPNnG2rUUC6ZMWQ2+de7vUjKnZJyWGVmviE3YqC0GCr92zG4
X-Proofpoint-GUID: dQVyZKkqOaCipRs4PqKgyzoIBybD2bag
X-Proofpoint-ORIG-GUID: dQVyZKkqOaCipRs4PqKgyzoIBybD2bag
X-Authority-Analysis: v=2.4 cv=dISmmPZb c=1 sm=1 tr=0 ts=682ca738 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qkre8nadHetdGucJBgsA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200131

On 5/20/25 9:25 AM, Krzysztof Kozlowski wrote:
> On Mon, May 19, 2025 at 02:04:03PM GMT, Kathiravan Thirumoorthy wrote:
>> Document the "qcom,imem" property for the watchdog device on Qualcomm
>> IPQ platforms. Use this property to extract the restart reason from
>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>> entry with this information, when the system reboots due to a watchdog
>> timeout.
>>
>> Describe this property for the IPQ5424 watchdog device and extend support
>> to other targets subsequently.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v4:
>> 	- New patch
>> ---
>>  .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..bbe9b68ff4c8b813744ffd86bb52303943366fa2 100644
>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> @@ -81,6 +81,16 @@ properties:
>>      minItems: 1
>>      maxItems: 5
>>  
>> +  qcom,imem:
> 
> Shoouldn't this be existing 'sram' property? If IMEM is something
> similar to OCMEM, then we already use sram for that.

We specifically want a handle to a predefined byte in IMEM, something akin
to qcom,4ln-config-sel in

Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

Konrad

