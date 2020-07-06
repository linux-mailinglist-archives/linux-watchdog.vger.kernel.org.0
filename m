Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6202158D5
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jul 2020 15:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgGFNvZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Jul 2020 09:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728961AbgGFNvY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Jul 2020 09:51:24 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A2FC061755;
        Mon,  6 Jul 2020 06:51:24 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o22so11997719pjw.2;
        Mon, 06 Jul 2020 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z6poFi9+zWbY1L4gWrKF8A7RpLC+zqPqyhWKFm2NtEY=;
        b=bi/1u86pOYCzm383ZnOKrlUK7mPZGkPQ42EF/iISNegNEdBvpIM7ihIeKQX6jV6oRV
         MpjS7eq9yI1fZKgc+FOF5e6Lc6U5GjYK+3OWOHHxvwXcMHvL2YiWtGsU3kpQNjx8Xcni
         z+Q8zqg/zRJTCDDGB5SnnDf1XBZAsKzoojKHloLsOzEApycYe/rkCIYbQ/ubLfunWtaW
         VrcuydUb2d21UrpBTmtvtZenBWJ3iYYDMOVeoMU/Izaz8k4paeXra+r7hU8Z7+/aMm/3
         B8RlBmxFixnbqve2S3afviAFd6CLblpqlXteRJcG3MyWxZ6q5G6tM06maGMRC6RGrIQ0
         ijhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z6poFi9+zWbY1L4gWrKF8A7RpLC+zqPqyhWKFm2NtEY=;
        b=P72mJIQunyoSbEXoUyJIo6lgsmsknX1JLFUQX/5K+NOg6XLQW4jMh5Klo7kG2bmWwL
         5+AWntvOiryOaQlK8se/SdJBdM0BOdXhXPAuvslyOzl5/h8QY6sBTj2Mzy+MWgBYXUbJ
         xv22Tplb/ReWUXyl4t6UvU2M0OgVApR7Bz0UN7FAYJXXKuuOb14AkGIZ+xBwuZTl/B+u
         MisGNoX6+b8vVi/9BP9ktaXnWVucwnRLNmYCdNqYX+FcDpl58c8eUjYATvM2QSJ3uIVa
         c6sUp1RLMzZ3n5dVS7naXZV7V8mdfuF9d3i7GnDLv2FxvRXNE33hhus6YP1nkv1hBbNp
         m+Nw==
X-Gm-Message-State: AOAM5310CVUTbnUU2K4aYei98DxANmsJCHhvvO/0NoJzg3X3krKNkGIr
        vtYbUy7AQUsVXfb7w9d5eVqKEY3gXv8=
X-Google-Smtp-Source: ABdhPJypJYrz0xeNjuylMgkjURdVfAuAbuXUUsahd8hCWmARlHuhrS+/gja/3CQojCFUOARO5eXDnQ==
X-Received: by 2002:a17:902:bccc:: with SMTP id o12mr43490783pls.29.1594043483881;
        Mon, 06 Jul 2020 06:51:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k7sm20008166pgh.46.2020.07.06.06.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 06:51:22 -0700 (PDT)
Subject: Re: [PATCH 1/1] watchdog: Add common nowayout parameter to booke_wdt
 driver
To:     Timothy Myers <timothy.myers@adtran.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        David Boike <david.boike@adtran.com>
References: <CH2PR19MB35903F8A6A46864C47A720029D930@CH2PR19MB3590.namprd19.prod.outlook.com>
 <20200626215133.GB254814@roeck-us.net>
 <CH2PR19MB359071AAD5258D75F7255CA99D690@CH2PR19MB3590.namprd19.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3e45acc4-3986-4172-36c6-758dcf1f0c60@roeck-us.net>
Date:   Mon, 6 Jul 2020 06:51:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CH2PR19MB359071AAD5258D75F7255CA99D690@CH2PR19MB3590.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gNy82LzIwIDQ6NTQgQU0sIFRpbW90aHkgTXllcnMgd3JvdGU6DQo+IA0KPiANCj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ICpGcm9tOiogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFp
bC5jb20+IG9uIGJlaGFsZiBvZiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+
DQo+ICpTZW50OiogRnJpZGF5LCBKdW5lIDI2LCAyMDIwIDQ6NTEgUE0NCj4gKlRvOiogVGlt
b3RoeSBNeWVycyA8dGltb3RoeS5teWVyc0BhZHRyYW4uY29tPg0KPiAqQ2M6KiBXaW0gVmFu
IFNlYnJvZWNrIDx3aW1AbGludXgtd2F0Y2hkb2cub3JnPjsgbGludXgtd2F0Y2hkb2dAdmdl
ci5rZXJuZWwub3JnIDxsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsg
RGF2aWQgQm9pa2UgPGRhdmlkLmJvaWtlQGFkdHJhbi5jb20+DQo+ICpTdWJqZWN0OiogUmU6
IFtQQVRDSCAxLzFdIHdhdGNoZG9nOiBBZGQgY29tbW9uIG5vd2F5b3V0IHBhcmFtZXRlciB0
byBib29rZV93ZHQgZHJpdmVyDQo+IKANCj4gT24gRnJpLCBKdW4gMjYsIDIwMjAgYXQgMDE6
Mzk6NDNQTSArMDAwMCwgVGltb3RoeSBNeWVycyB3cm90ZToNCj4+IEFkZCB0aGUgY29tbW9u
ICJub3dheW91dCIgcGFyYW1ldGVyIHRvIGJvb2tlX3dkdCB0byBtYWtlIHRoaXMgYmVoYXZp
b3INCj4+IHNlbGVjdGFibGUgYXQgcnVudGltZSBhbmQgdG8gbWFrZSB0aGUgaW1wbGVtZW50
YXRpb24gbW9yZSBjb25zaXN0ZW50IHdpdGgNCj4+IG1hbnkgb3RoZXIgd2F0Y2hkb2cgZHJp
dmVycy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaW1vdGh5IE15ZXJzIDx0aW1vdGh5Lm15
ZXJzQGFkdHJhbi5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogR3VlbnRlciBSb2VjayA8bGlu
dXhAcm9lY2stdXMubmV0Pg0KPiANCj4gSGVsbG8sDQo+IKAgoCBJIGFsc28gaGF2ZSBhIHNp
bWlsYXIgcXVlc3Rpb24gYXOgVGllemh1IHJlY2VudGx5LiBOb3cgdGhhdCB0aGlzIHBhdGNo
IGhhcyBiZWVuIHJldmlld2VkLCB3aGF0IGlzIHRoZSBuZXh0IHN0ZXA/DQo+IFRoYW5rIHlv
dSwNCj4gVGltIE15ZXJzDQoNCkludGVyZXN0aW5nLiBUaGUgb3RoZXIgcGF0Y2ggaXMgaW4g
bXkgLW5leHQgdHJlZSwgYW5kIEkgcGxhbiB0byBzZW5kIGEgcHVsbA0KcmVxdWVzdCB0byBX
aW0gc2hvcnRseS4gSG93ZXZlciwgcGF0Y2h3b3JrIGhhcyBubyByZWNvcmQgb2YgeW91ciBw
YXRjaC4NClNpbmNlIEkgYXBwbHkgcGF0Y2hlcyBmcm9tIHBhdGNod29yaywgaXQgZWZmZWN0
aXZlbHkgZ290IGxvc3QuIFBsZWFzZSByZXNlbmQsDQpwcmVmZXJhYmx5IHdpdGggbXkgUmV2
aWV3ZWQtYnk6IHRhZy4NCg0KR3VlbnRlcg0KDQo+IA0KPj4gLS0tDQo+PiBkcml2ZXJzL3dh
dGNoZG9nL2Jvb2tlX3dkdC5jIHwgNiArKysrKy0NCj4+IDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy93YXRjaGRvZy9ib29rZV93ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvYm9va2Vfd2R0LmMN
Cj4+IGluZGV4IDlkMDliYmZkZWYyMC4uNzgxN2ZiOTc2ZjljIDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy93YXRjaGRvZy9ib29rZV93ZHQuYw0KPj4gKysrIGIvZHJpdmVycy93YXRjaGRv
Zy9ib29rZV93ZHQuYw0KPj4gQEAgLTM5LDYgKzM5LDExIEBAIHN0YXRpYyBib29sIGJvb2tl
X3dkdF9lbmFibGVkOw0KPj4gbW9kdWxlX3BhcmFtKGJvb2tlX3dkdF9lbmFibGVkLCBib29s
LCAwKTsNCj4+IHN0YXRpYyBpbnQgYm9va2Vfd2R0X3BlcmlvZCA9IENPTkZJR19CT09LRV9X
RFRfREVGQVVMVF9USU1FT1VUOw0KPj4gbW9kdWxlX3BhcmFtKGJvb2tlX3dkdF9wZXJpb2Qs
IGludCwgMCk7DQo+PiArc3RhdGljIGJvb2wgbm93YXlvdXQgPSBXQVRDSERPR19OT1dBWU9V
VDsNCj4+ICttb2R1bGVfcGFyYW0obm93YXlvdXQsIGJvb2wsIDApOw0KPj4gK01PRFVMRV9Q
QVJNX0RFU0Mobm93YXlvdXQsDQo+PiArICJXYXRjaGRvZyBjYW5ub3QgYmUgc3RvcHBlZCBv
bmNlIHN0YXJ0ZWQgKGRlZmF1bHQ9Ig0KPj4gKyBfX01PRFVMRV9TVFJJTkcoV0FUQ0hET0df
Tk9XQVlPVVQpICIpIik7DQo+Pg0KPj4gI2lmZGVmIENPTkZJR19QUENfRlNMX0JPT0szRQ0K
Pj4NCj4+IEBAIC0yMTUsNyArMjIwLDYgQEAgc3RhdGljIHZvaWQgX19leGl0IGJvb2tlX3dk
dF9leGl0KHZvaWQpDQo+PiBzdGF0aWMgaW50IF9faW5pdCBib29rZV93ZHRfaW5pdCh2b2lk
KQ0KPj4gew0KPj4gaW50IHJldCA9IDA7DQo+PiAtIGJvb2wgbm93YXlvdXQgPSBXQVRDSERP
R19OT1dBWU9VVDsNCj4+DQo+PiBwcl9pbmZvKCJwb3dlcnBjIGJvb2stZSB3YXRjaGRvZyBk
cml2ZXIgbG9hZGVkXG4iKTsNCj4+IGJvb2tlX3dkdF9pbmZvLmZpcm13YXJlX3ZlcnNpb24g
PSBjdXJfY3B1X3NwZWMtPnB2cl92YWx1ZTsNCj4+DQo+PiBiYXNlLWNvbW1pdDogZGQwZDcx
ODE1MmU0YzY1YjE3MzA3MGQ0OGVhOWRmYzA2ODk0YzNlNQ0KPj4gLS0NCj4+IDIuMjAuMQ0K
Pj4NCj4+DQo+Pg0KPj4gVGltb3RoeSBNeWVycw0KPj4gU29mdHdhcmUgRGVzaWduIEVuZ2lu
ZWVyDQo+Pg0KPj4gT2ZmaWNlOiAyNTYuOTYzLjg4NDQNCj4+IEVtYWlsOiB0aW1vdGh5Lm15
ZXJzQGFkdHJhbi5jb208aHR0cHM6Ly9vd2EuYWR0cmFuLmNvbS9vd2EvcmVkaXIuYXNweD9D
PUxOSU5SRVJqMVZRZ0FLRTlVTml1LWIySjUweWJfbUt1SzlPWDhKNHNwalFxTXptQUtselVD
QS4uJlVSTD1tYWlsdG8lM2F0b20ucGF0dGVyc29uJTQwYWR0cmFuLmNvbSA8aHR0cHM6Ly9w
cm90ZWN0LXVzLm1pbWVjYXN0LmNvbS9zL2hoY29DNzNWa0JoRTNMNm5GTjRJMDY/ZG9tYWlu
PW93YS5hZHRyYW4uY29tPj4NCj4+IFdlYjogd3d3LmFkdHJhbi5jb20gPGh0dHBzOi8vcHJv
dGVjdC11cy5taW1lY2FzdC5jb20vcy9GZTM4QzgyS2xERk9uOU1CRm9iT3JIP2RvbWFpbj1h
ZHRyYW4uY29tPjxodHRwczovL293YS5hZHRyYW4uY29tL293YS9yZWRpci5hc3B4P0M9QU80
XzBmcGdONEdteXk0YlBlMHNUeExLZlJKcnk1UXJzZTNhSlN3MDF6RXFNem1BS2x6VUNBLi4m
VVJMPWh0dHAlM2ElMmYlMmZzLmJsLTEuY29tJTJmaCUyZkNvWTFtejklM2Z1cmwlM2RodHRw
JTNhJTJmJTJmd3d3LmFkdHJhbi5jb20gPGh0dHBzOi8vcHJvdGVjdC11cy5taW1lY2FzdC5j
b20vcy9wWGd5QzlyWW1FdVJvOEtyVTF1elNoP2RvbWFpbj1vd2EuYWR0cmFuLmNvbT4+DQo+
Pg0KPj4gQURUUkFODQo+PiA5MDEgRXhwbG9yZXIgQm91bGV2YXJkDQo+PiBIdW50c3ZpbGxl
LCBBTCAzNTgwNiAtIFVTQQ0KDQo=
