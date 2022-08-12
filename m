Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84CB590E88
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Aug 2022 11:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbiHLJ40 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Aug 2022 05:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237736AbiHLJ4S (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Aug 2022 05:56:18 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26BA95FAE8
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Aug 2022 02:56:17 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j1so648202wrw.1
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Aug 2022 02:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=hrJUt/lixuN/k6zIilPZKZz5TtcpiyzojSORFs5bM4Y=;
        b=mF9fvL2lgIF67cRhb2D0TLxM9I7hJDlOq9IUmgPMvERj22qVGlDgoQofcVnDbsEZoD
         16f33bSENWhzqhMNe5W0NPsYhXGfAXX61PfKp/LpGj7XVqJLhsuX9GSEOoTbTBb6YBJ5
         fTnJ9YjrDENwqJheHypj0BcjIZ/uYAyuz1mIUa+QTb4koaZlFXECbGpY7Dv7Crv5TjCF
         /1Suuf1BrvhAui3iADczKzQYUDlJsiB+pIJE1jCYRzfX1pzQQJ66howPn1SZz5wjZypU
         R/mPcoiABGrXDp7nQVaxuYslwLPgzRTTXWZI6fYCMQo5DZvs/N+AhgYWxl7Pq1TRLn9p
         7jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=hrJUt/lixuN/k6zIilPZKZz5TtcpiyzojSORFs5bM4Y=;
        b=7c69gbbAnKZ7mTj4YbguP668qjUzFPh8UNbPduDNnFglRI7wbGnrpuFvQy9+ebUq1W
         CNJewyapNboRTqIlWgbUk7WV8FTK+vIhlH7oZFXNvee9xtqpAAj9Bq4tXjj7X8uNLqGF
         /KOFZyXCOkF/pMkorWE13zff0aMq/oLBKAQ4O0gHwHhIDDXGHSQ4FUpJm1CvL8RWr/4v
         f6MmUkogslXFagOWPkN3lpFe3VvyzR2o+NiLrl1prkwHlzf6xmeWP+t/TsWOSse8UKLV
         22V/8gjtfKzG5XTqr1cKquacynNMq+TTASHHkDmsppnn5afuMPEbLj3NbdsI7puhjuFn
         wk5g==
X-Gm-Message-State: ACgBeo1MbuToIBwb454wkej3yr9FKYkzxxQKUlmndwtsYcnay36TYavZ
        ULn6BkmJxzNpYHKerw5gzZmJcZNjcsYQZQLt/AXbcUN1rtY=
X-Google-Smtp-Source: AA6agR4yMEB9AC8N5e9QE/qE/rQzoFeZp4azaV+61BeTxb2xDEsRMjQZSilkjJWUs+EsLFusn9veYVmekN2+ThMoinE=
X-Received: by 2002:a05:6000:3c6:b0:220:5efd:423c with SMTP id
 b6-20020a05600003c600b002205efd423cmr1695399wrg.214.1660298175651; Fri, 12
 Aug 2022 02:56:15 -0700 (PDT)
MIME-Version: 1.0
From:   Kegl Rohit <keglrohit@gmail.com>
Date:   Fri, 12 Aug 2022 11:56:04 +0200
Message-ID: <CAMeyCbiVVTmpV8pazAPLtew0yQSYeb5ykeHzCs_A=nBUK7d1bg@mail.gmail.com>
Subject: rn5t618_wdt: WATCHDOG_NOWAYOUT not working
To:     linux-watchdog@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000fb551205e6084ac9"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--000000000000fb551205e6084ac9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

Our board uses the RN5T567 as /dev/watchdog source via i2c communication.
RN5T567 is using the rn5t618_wdt.c driver

Our kernel has CONFIG_WATCHDOG_NOWAYOUT=3Dy enabled

# Starting the wdt works as expected
echo -n '1' > /dev/watchdog

# Stopping the wdt works as expected no reboot will be issued
echo -n 'V' > /dev/watchdog

# Starting the wdt again will enable the wdt again
# BUT while the wdt is triggered every second the system reboots
while true; do echo -n '1' > /dev/watchdog; sleep 1; done

Digging deeper into the issue I could find out that the remap is
initialized to cache the register accesses RN5T618_WATCHDOG (0x0b) and
RN5T618_PWRIRQ (0x13).

So I expect that because of this caching the IRQ status bit was never reset=
.
The status register must not be cached because its set by the RN5T567.
Also it is not ideal to cache the access to the watchdog register
which resets the counter via read write cycle.

debugfs shows the regmap setting for these registers:
[root@imx7d /sys/kernel/debug]# cat regmap/0-0033/access
// third column means volatile yes or no
=E2=80=A6
0b: y y n n
=E2=80=A6
13: y y n n

After marking these registers volatile, stopping the wdt and starting
again seems to work.

Furthermore it is not necessary to do a RN5T618_WATCHDOG read AND
write cycle to reset the wdt counter.
The source code states:
/* The counter is restarted after a R/W access to watchdog register */

The RN5T567 datasheet states:
=E2=80=9CThe count value of watchdog timer is cleared by accessing (R/W) to
this register.=E2=80=9D

Tests showed that a single read is enough. I did not check other chip
variants which use the same driver.

In my opinion a write cycle is even dangerous if there is some strange
situation and the write cycle disables the wdt or changes the wdt
settings stored in this register.

I still don't know why the irq status bit is cleared on every ping()
but I kept it there.
Attached is my patch tested with RN5T567.
Is the rn5t618_wdt.c driver maintained? Strange that such issue was
never noticed.

--000000000000fb551205e6084ac9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-pmic-rn5t618-fix-pmic-reboot-when-wdt-is-restarted.patch"
Content-Disposition: attachment; 
	filename="0001-pmic-rn5t618-fix-pmic-reboot-when-wdt-is-restarted.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l6q8knjf0>
X-Attachment-Id: f_l6q8knjf0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3JuNXQ2MTguYyBiL2RyaXZlcnMvbWZkL3JuNXQ2MTgu
YwppbmRleCA2NTJhNWU2MDA2N2YuLmI0MTRhYmNkZmVjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
ZmQvcm41dDYxOC5jCisrKyBiL2RyaXZlcnMvbWZkL3JuNXQ2MTguYwpAQCAtNDcsOCArNDcsMTAg
QEAgc3RhdGljIGJvb2wgcm41dDYxOF92b2xhdGlsZV9yZWcoc3RydWN0IGRldmljZSAqZGV2LCB1
bnNpZ25lZCBpbnQgcmVnKQogCWNhc2UgUk41VDYxOF9SVENfU0VDT05EUyAuLi4gUk41VDYxOF9S
VENfWUVBUjoKIAljYXNlIFJONVQ2MThfQ0hHU1RBVEU6CiAJY2FzZSBSTjVUNjE4X0NIR0NUUkxf
SVJSIC4uLiBSTjVUNjE4X0NIR0VSUl9NT05JOgogCWNhc2UgUk41VDYxOF9DT05UUk9MIC4uLiBS
TjVUNjE4X0NDX0FWRVJFRzA6CisJY2FzZSBSTjVUNjE4X1dBVENIRE9HOiAvLyBzaG91bGQgbm90
IGJlIGNhY2hlZCBiZWNhdXNlIG9mIHIvdyB0byByZXNldCBjb3VudGVyCisJY2FzZSBSTjVUNjE4
X1BXUklSUTogICAvLyBzaG91bGQgbm90IGJlIGNhY2hlZCBiZWNhdXNlIGl0cyBzZXQgYnkgaGFy
ZHdhcmUKIAkJcmV0dXJuIHRydWU7CiAJZGVmYXVsdDoKIAkJcmV0dXJuIGZhbHNlOwogCX0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvcm41dDYxOF93ZHQuYyBiL2RyaXZlcnMvd2F0Y2hk
b2cvcm41dDYxOF93ZHQuYwppbmRleCA2ZTUyNGM4ZTI2YTguLjgzZDNmMDA2ZjgxMiAxMDA2NDQK
LS0tIGEvZHJpdmVycy93YXRjaGRvZy9ybjV0NjE4X3dkdC5jCisrKyBiL2RyaXZlcnMvd2F0Y2hk
b2cvcm41dDYxOF93ZHQuYwpAQCAtNzUsOCArNzUsMTMgQEAgc3RhdGljIGludCBybjV0NjE4X3dk
dF9zdGFydChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZHRfZGV2KQogCXJldCA9IHJuNXQ2MThf
d2R0X3NldF90aW1lb3V0KHdkdF9kZXYsIHdkdF9kZXYtPnRpbWVvdXQpOwogCWlmIChyZXQpCiAJ
CXJldHVybiByZXQ7CiAKKwkvKiBDbGVhciBwZW5kaW5nIHdhdGNoZG9nIGludGVycnVwdCAqLwor
CXJldCA9IHJlZ21hcF93cml0ZSh3ZHQtPnJuNXQ2MTgtPnJlZ21hcCwgUk41VDYxOF9QV1JJUlEs
IH5STjVUNjE4X1BXUklSUV9JUl9XRE9HKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCiAJ
LyogZW5hYmxlIHJlcG93ZXItb24gKi8KIAlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMod2R0LT5y
bjV0NjE4LT5yZWdtYXAsIFJONVQ2MThfUkVQQ05ULAogCQkJCSBSTjVUNjE4X1JFUENOVF9SRVBX
Uk9OLAogCQkJCSBSTjVUNjE4X1JFUENOVF9SRVBXUk9OKTsKQEAgLTExNCwxNSArMTE5LDEwIEBA
IHN0YXRpYyBpbnQgcm41dDYxOF93ZHRfcGluZyhzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZHRf
ZGV2KQogCXJldCA9IHJlZ21hcF9yZWFkKHdkdC0+cm41dDYxOC0+cmVnbWFwLCBSTjVUNjE4X1dB
VENIRE9HLCAmdmFsKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gcmVnbWFw
X3dyaXRlKHdkdC0+cm41dDYxOC0+cmVnbWFwLCBSTjVUNjE4X1dBVENIRE9HLCB2YWwpOwotCWlm
IChyZXQpCi0JCXJldHVybiByZXQ7Ci0KIAkvKiBDbGVhciBwZW5kaW5nIHdhdGNoZG9nIGludGVy
cnVwdCAqLwotCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMod2R0LT5ybjV0NjE4LT5yZWdtYXAs
IFJONVQ2MThfUFdSSVJRLAotCQkJCSAgUk41VDYxOF9QV1JJUlFfSVJfV0RPRywgMCk7CisJcmV0
dXJuIHJlZ21hcF93cml0ZSh3ZHQtPnJuNXQ2MTgtPnJlZ21hcCwgUk41VDYxOF9QV1JJUlEsIH5S
TjVUNjE4X1BXUklSUV9JUl9XRE9HKTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCB3YXRjaGRv
Z19pbmZvIHJuNXQ2MThfd2R0X2luZm8gPSB7CiAJLm9wdGlvbnMJPSBXRElPRl9TRVRUSU1FT1VU
IHwgV0RJT0ZfTUFHSUNDTE9TRSB8Ci0tIAoyLjMwLjIKCg==
--000000000000fb551205e6084ac9--
